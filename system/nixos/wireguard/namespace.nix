{
  pkgs,
  lib,
  name,
  veth,
  configFile,
  ...
}:

let
  inherit (lib.strings) concatMapStringsSep;
in
{
  environment.etc."netns/${name}/nsswitch.conf" = {
    mode = "0644";
    text = ''
      passwd:    files systemd
      group:     files [success=merge] systemd
      shadow:    files

      hosts:     dns [!UNAVAIL=return] files
      networks:  files

      ethers:    files
      services:  files
      protocols: files
      rpc:       files
    '';
  };

  systemd = {
    services = {
      "wg-${name}" = {
        description = "${name} network interface";
        bindsTo = [ "netns@${name}.service" ];
        wants = [ "network-online.target" ];
        after = [
          "netns@${name}.service"
          "network-online.target"
          "run-agenix.d.mount"
        ];

        path = with pkgs; [
          gawk
          iproute2
          sysctl
          wireguard-tools
        ];

        environment.WG_ENDPOINT_RESOLUTION_RETRIES = "infinity";

        restartTriggers = [ "${configFile.file}" ];

        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = pkgs.writers.writeBash "wg-${name}-up" ''
            set -e
            echo "Setting up DNS"
            mkdir -p "/etc/netns/${name}"
            echo "nameserver $(awk 'NR == 1 {printf "%s", $4}' ${configFile.path})" >"/etc/netns/${name}/resolv.conf"
            echo "nameserver $(awk 'NR == 1 {printf "%s", $5}' ${configFile.path})" >>"/etc/netns/${name}/resolv.conf"
            chmod 644 "/etc/netns/${name}/resolv.conf"
            echo "Setting lo to up ..."
            ip -n ${name} link set lo up
            echo "Creating veth network ..."
            ip link add name veth${name}host0 type veth peer veth${name}ns0 netns ${name}
            ip address add ${veth.hostIP}/30 dev veth${name}host0
            ip -n ${name} address add ${veth.nsIP}/30 dev veth${name}ns0
            sysctl net.ipv6.conf.veth${name}host0.disable_ipv6=1
            ip netns exec ${name} sysctl net.ipv6.conf.veth${name}ns0.disable_ipv6=1
            ip link set veth${name}host0 up
            ip -n ${name} link set veth${name}ns0 up
            echo "Creating wg${name}0 interface ..."
            ip link add wg${name}0 type wireguard
            ip link set wg${name}0 netns ${name}
            ip -n ${name} address add "$(awk 'NR == 1 {printf "%s", $2}' ${configFile.path})" dev wg${name}0
            ip -n ${name} -6 address add "$(awk 'NR == 1 {printf "%s", $3}' ${configFile.path})" dev wg${name}0
            ip -n ${name} link set wg${name}0 mtu 1320
            ip netns exec ${name} wg setconf wg${name}0 ${configFile.path}
            ip -n ${name} link set wg${name}0 up
            ip -n ${name} route add default dev wg${name}0
            ip -n ${name} -6 route add default dev wg${name}0
            echo "Done!"
          '';
          ExecStop = pkgs.writers.writeBash "wg-${name}-down" ''
            echo "Tearing down wg${name}0 ..."
            ip -n ${name} route del default dev wg${name}0
            ip -n ${name} -6 route del default dev wg${name}0
            ip -n ${name} link del wg${name}0
            echo "Tearing down veth network ..."
            ip link del veth${name}host0
            ip -n ${name} link del veth${name}ns0
            echo "Setting lo to down ..."
            ip -n ${name} link set lo down
            echo "Done!"
          '';
        };
      };

      "wg-${name}-firewall" = {
        description = "${name} firewall";
        bindsTo = [ "wg-${name}.service" ];
        after = [ "wg-${name}.service" ];
        wantedBy = [ "multi-user.target" ];

        path = with pkgs; [
          gawk
          iptables
        ];

        # FIXME: this module may also try to load kernel modules, but
        # containers don't have CAP_SYS_MODULE.  So the host system had
        # better have all necessary modules already loaded.
        unitConfig = {
          ConditionCapability = "CAP_NET_ADMIN";
          DefaultDependencies = false;
        };

        reloadIfChanged = true;

        serviceConfig =
          let
            writeShScript =
              name: text:
              let
                dir = pkgs.writeScriptBin name ''
                  #! ${pkgs.runtimeShell} -e

                  ip46tables() {
                    iptables -w "$@"
                    ip6tables -w "$@"
                  }

                  ${text}
                '';
              in
              "${dir}/bin/${name}";

            startScript = writeShScript "wg-firewall-start" (
              ''
                ip46tables -D INPUT -j wg-fw 2> /dev/null || true
                ip46tables -D OUTPUT -j wg-fw-out 2> /dev/null || true
                for chain in wg-fw wg-fw-out wg-fw-accept wg-fw-log-refuse wg-fw-refuse; do
                  ip46tables -F "$chain" 2> /dev/null || true
                  ip46tables -X "$chain" 2> /dev/null || true
                done

                ip46tables -N wg-fw-accept
                ip46tables -A wg-fw-accept -j ACCEPT

                ip46tables -N wg-fw-refuse
                ip46tables -A wg-fw-refuse -j DROP

                ip46tables -N wg-fw-log-refuse
                ip46tables -A wg-fw-log-refuse -p tcp --syn -j LOG --log-level info --log-prefix "refused connection: "
                ip46tables -A wg-fw-log-refuse -m pkttype ! --pkt-type unicast -j wg-fw-refuse
                ip46tables -A wg-fw-log-refuse -j wg-fw-refuse

                ## IN

                ip46tables -N wg-fw

                ip46tables -A wg-fw -i lo -j wg-fw-accept

                ip46tables -A wg-fw -m conntrack --ctstate ESTABLISHED,RELATED -j wg-fw-accept

                # Ports
              ''
              + (concatMapStringsSep "\n" (
                p: "iptables -A wg-fw -p tcp --dport ${builtins.toString p} -j wg-fw-accept -i veth${name}ns0"
              ) veth.ports)
              + ''

                # Forwarded Ports
                config_forwarded_port="$(awk 'NR == 1 {printf "%s", $6}' ${configFile.path})"
                if [ -n "$config_forwarded_port" ]; then
                  ip46tables -A wg-fw -p tcp --dport "$config_forwarded_port" -j wg-fw-accept -i wg${name}0
                  ip46tables -A wg-fw -p udp --dport "$config_forwarded_port" -j wg-fw-accept -i wg${name}0
                fi

                iptables -w -A wg-fw -p icmp --icmp-type echo-request -j wg-fw-accept

                ip6tables -A wg-fw -p icmpv6 --icmpv6-type redirect -j DROP
                ip6tables -A wg-fw -p icmpv6 --icmpv6-type 139 -j DROP
                ip6tables -A wg-fw -p icmpv6 -j wg-fw-accept

                ip46tables -A wg-fw -j wg-fw-log-refuse

                ## OUT

                ip46tables -N wg-fw-out

                # Block non-local traffic
                iptables -A wg-fw-out -i veth${name}ns0 ! -d ${veth.hostIP}/32 -j wg-fw-refuse
                iptables -A wg-fw-out -i veth${name}ns0 ! -d ${veth.nsIP}/32 -j wg-fw-refuse
                ip6tables -A wg-fw-out -i veth${name}ns0 -j wg-fw-refuse

                ip46tables -A wg-fw-out -j wg-fw-accept

                ## SETUP

                ip46tables -A INPUT -j wg-fw
                ip46tables -A OUTPUT -j wg-fw-out
              ''
            );

            stopScript = writeShScript "wg-firewall-stop" ''
              ip46tables -D INPUT -j wg-drop 2>/dev/null || true
              ip46tables -D OUTPUT -j wg-drop 2>/dev/null || true

              ip46tables -D INPUT -j wg-fw 2>/dev/null || true
              ip46tables -D OUTPUT -j wg-fw-out 2>/dev/null || true
            '';

            reloadScript = writeShScript "wg-firewall-reload" ''
              ip46tables -D INPUT -j wg-drop 2>/dev/null || true
              ip46tables -D OUTPUT -j wg-drop 2>/dev/null || true
              ip46tables -F wg-drop 2>/dev/null || true
              ip46tables -X wg-drop 2>/dev/null || true
              ip46tables -N wg-drop
              ip46tables -A wg-drop -j DROP

              ip46tables -A INPUT -j wg-drop
              ip46tables -A OUTPUT -j wg-drop

              if ${startScript}; then
                ip46tables -D INPUT -j wg-drop 2>/dev/null || true
                ip46tables -D OUTPUT -j wg-drop 2>/dev/null || true
              else
                echo "Failed to reload firewall... Stopping"
                ${stopScript}
                exit 1
              fi
            '';
          in
          {
            Type = "oneshot";
            RemainAfterExit = true;
            NetworkNamespacePath = "/var/run/netns/${name}";
            BindReadOnlyPaths = [
              "/etc/netns/${name}/resolv.conf:/etc/resolv.conf:norbind"
              "/etc/netns/${name}/nsswitch.conf:/etc/nsswitch.conf:norbind"
            ];
            ExecStart = "@${startScript} wg-firewall-start";
            ExecReload = "@${reloadScript} wg-firewall-reload";
            ExecStop = "@${stopScript} wg-firewall-stop";
          };
      };
    };

    tmpfiles.rules = [
      "d /etc/netns/${name}/nscd-kill 0755 nscd nscd"
    ];
  };
}
