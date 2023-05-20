{ pkgs, secret, ... }:

# Heavily inspired by the built-in firewall scripts, minus the nice interface

let
  writeShScript = name: text:
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

  startScript = writeShScript "wg-firewall-start" ''
    ip46tables -D INPUT -j wg-fw 2> /dev/null || true
    for chain in wg-fw wg-fw-accept wg-fw-log-refuse wg-fw-refuse; do
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

    ip46tables -N wg-fw

    ip46tables -A wg-fw -i lo -j wg-fw-accept

    ip46tables -A wg-fw -m conntrack --ctstate ESTABLISHED,RELATED -j wg-fw-accept

    # Ports
    ip46tables -A wg-fw -p tcp --dport 6801 -j wg-fw-accept -i vethwgns0
    ip46tables -A wg-fw -p tcp --dport 7441 -j wg-fw-accept -i vethwgns0
    ip46tables -A wg-fw -p tcp --dport 7474 -j wg-fw-accept -i vethwgns0
    ip46tables -A wg-fw -p tcp --dport 7878 -j wg-fw-accept -i vethwgns0
    ip46tables -A wg-fw -p tcp --dport 8071 -j wg-fw-accept -i vethwgns0
    ip46tables -A wg-fw -p tcp --dport 8080 -j wg-fw-accept -i vethwgns0
    ip46tables -A wg-fw -p tcp --dport 8989 -j wg-fw-accept -i vethwgns0
    ip46tables -A wg-fw -p tcp --dport 9696 -j wg-fw-accept -i vethwgns0
    ip46tables -A wg-fw -p tcp --dport 9999 -j wg-fw-accept -i vethwgns0

    ip46tables -A wg-fw -p tcp --dport ${builtins.toString secret.wireguard.forwardedPort} -j wg-fw-accept -i wg0
    ip46tables -A wg-fw -p udp --dport ${builtins.toString secret.wireguard.forwardedPort} -j wg-fw-accept -i wg0 

    iptables -w -A wg-fw -p icmp --icmp-type echo-request -j wg-fw-accept

    ip6tables -A wg-fw -p icmpv6 --icmpv6-type redirect -j DROP
    ip6tables -A wg-fw -p icmpv6 --icmpv6-type 139 -j DROP
    ip6tables -A wg-fw -p icmpv6 -j wg-fw-accept

    ip46tables -A wg-fw -j wg-fw-log-refuse
    ip46tables -A INPUT -j wg-fw
  '';

  stopScript = writeShScript "wg-firewall-stop" ''
    ip46tables -D INPUT -j wg-drop 2>/dev/null || true

    ip46tables -D INPUT -j wg-fw 2>/dev/null || true
  '';

  reloadScript = writeShScript "wg-firewall-reload" ''
    ip46tables -D INPUT -j wg-drop 2>/dev/null || true
    ip46tables -F wg-drop 2>/dev/null || true
    ip46tables -X wg-drop 2>/dev/null || true
    ip46tables -N wg-drop
    ip46tables -A wg-drop -j DROP

    ip46tables -A INPUT -j wg-drop

    if ${startScript}; then
      ip46tables -D INPUT -j wg-drop 2>/dev/null || true
    else
      echo "Failed to reload firewall... Stopping"
      ${stopScript}
      exit 1
    fi
  '';
in
{
  systemd.services.wg-firewall = {
    description = "Wireguard Firewall";
    bindsTo = [ "wg.service" ];
    after = [ "wg.service" ];
    wantedBy = [ "multi-user.target" ];

    path = [ pkgs.iptables ];

    # FIXME: this module may also try to load kernel modules, but
    # containers don't have CAP_SYS_MODULE.  So the host system had
    # better have all necessary modules already loaded.
    unitConfig.ConditionCapability = "CAP_NET_ADMIN";
    unitConfig.DefaultDependencies = false;

    reloadIfChanged = true;

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      NetworkNamespacePath = "/var/run/netns/wg";
      BindReadOnlyPaths = [
        "/etc/netns/wg/resolv.conf:/etc/resolv.conf:norbind"
        "/etc/netns/wg/nsswitch.conf:/etc/nsswitch.conf:norbind"
      ];
      ExecStart = "@${startScript} wg-firewall-start";
      ExecReload = "@${reloadScript} wg-firewall-reload";
      ExecStop = "@${stopScript} wg-firewall-stop";
    };
  };
}
