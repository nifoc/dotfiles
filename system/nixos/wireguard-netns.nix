{ pkgs, config, secret, ... }:

{
  environment.systemPackages = with pkgs; [ ldns tcpdump wireguard-tools ];

  environment.etc."netns/wg/resolv.conf" = {
    mode = "0644";
    text = ''
      nameserver ${secret.wireguard.dnsv4}
      nameserver ${secret.wireguard.dnsv6}
    '';
  };

  environment.etc."netns/wg/nsswitch.conf" = {
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

  systemd.services."netns@" = {
    description = "%I network namespace";
    before = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.iproute2}/bin/ip netns add %I";
      ExecStop = "${pkgs.iproute2}/bin/ip netns del %I";
    };
  };

  systemd.services.wg = {
    description = "wg network interface";
    bindsTo = [ "netns@wg.service" ];
    wants = [ "network-online.target" ];
    after = [ "netns@wg.service" "network-online.target" "run-agenix.d.mount" ];
    environment.WG_ENDPOINT_RESOLUTION_RETRIES = "infinity";

    restartTriggers = [
      "${config.age.secrets.wireguard-config.file}"
    ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = with pkgs; writers.writeBash "wg-up" ''
        set -e
        echo "Setting lo to up ..."
        ${iproute2}/bin/ip -n wg link set lo up
        echo "Creating veth network ..."
        ${iproute2}/bin/ip link add name vethwghost0 type veth peer vethwgns0 netns wg
        ${iproute2}/bin/ip address add 192.168.42.1/24 dev vethwghost0
        ${iproute2}/bin/ip -n wg address add 192.168.42.2/24 dev vethwgns0
        ${iproute2}/bin/ip link set vethwghost0 up
        ${iproute2}/bin/ip -n wg link set vethwgns0 up
        echo "Creating wg0 interface ..."
        ${iproute2}/bin/ip link add wg0 type wireguard
        ${wireguard-tools}/bin/wg setconf wg0 ${config.age.secrets.wireguard-config.path}
        ${iproute2}/bin/ip link set wg0 netns wg
        ${iproute2}/bin/ip -n wg address add ${secret.wireguard.ipv4} dev wg0
        ${iproute2}/bin/ip -n wg -6 address add ${secret.wireguard.ipv6} dev wg0
        ${iproute2}/bin/ip -n wg link set wg0 mtu 1320
        ${iproute2}/bin/ip -n wg link set wg0 up
        ${iproute2}/bin/ip -n wg route add default dev wg0
        ${iproute2}/bin/ip -n wg -6 route add default dev wg0
        echo "Done!"
      '';
      ExecStop = with pkgs; writers.writeBash "wg-down" ''
        echo "Tearing down wg0 ..."
        ${iproute2}/bin/ip -n wg route del default dev wg0
        ${iproute2}/bin/ip -n wg -6 route del default dev wg0
        ${iproute2}/bin/ip -n wg link del wg0
        echo "Tearing down veth network ..."
        ${iproute2}/bin/ip link del vethwghost0
        ${iproute2}/bin/ip -n wg link del vethwgns0
        echo "Setting lo to down ..."
        ${iproute2}/bin/ip -n wg link set lo down
        echo "Done!"
      '';
    };
  };
}
