{
  pkgs,
  name,
  vlan,
  ...
}:

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
      "vlan-ns-${name}" = {
        description = "${name} network interface";
        bindsTo = [ "netns@${name}.service" ];
        wants = [ "network-online.target" ];
        after = [
          "netns@${name}.service"
          "network-online.target"
          "run-agenix.d.mount"
        ];

        path = with pkgs; [
          iproute2
          sysctl
        ];

        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = pkgs.writers.writeBash "vlan-ns-${name}-up" ''
            set -e
            echo "Setting up DNS"
            mkdir -p "/etc/netns/${name}"
            echo "nameserver ${vlan.ns1}" >"/etc/netns/${name}/resolv.conf"
            echo "nameserver ${vlan.ns2}" >>"/etc/netns/${name}/resolv.conf"
            chmod 644 "/etc/netns/${name}/resolv.conf"
            echo "Setting lo to up ..."
            ip -n ${name} link set lo up
            echo "Moving VLAN interface into namespace ..."
            ip link set ${vlan.interface} netns ${name}
            ip netns exec ${name} sysctl net.ipv6.conf.${vlan.interface}.disable_ipv6=1
            ip -n ${name} address add ${vlan.ip} dev ${vlan.interface}
            ip -n ${name} link set ${vlan.interface} up
            ip -n ${name} route add default via ${vlan.gateway} dev ${vlan.interface} onlink
            echo "Done!"
          '';
          ExecStop = pkgs.writers.writeBash "vlan-ns-${name}-down" ''
            echo "Moving VLAN interface out of namespace ..."
            ip -n ${name} link set ${vlan.interface} down
            ip -n ${name} route del default via ${vlan.gateway} dev ${vlan.interface} onlink
            ip -n ${name} link set ${vlan.interface} netns 1
            echo "Setting lo to down ..."
            ip -n ${name} link set lo down
            echo "Done!"
          '';
        };
      };
    };

    tmpfiles.rules = [
      "d /etc/netns/${name}/nscd-kill 0755 nscd nscd"
    ];
  };
}
