{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ wireguard-tools ];

  systemd.services."netns@" = {
    description = "%I network namespace";
    before = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.iproute}/bin/ip netns add %I";
      ExecStop = "${pkgs.iproute}/bin/ip netns del %I";
    };
  };

  systemd.services.wg = {
    description = "wg network interface";
    bindsTo = [ "netns@wg.service" ];
    requires = [ "network-online.target" ];
    after = [ "netns@wg.service" "run-agenix.d.mount" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = with pkgs; writers.writeBash "wg-up" ''
        set -e
        echo "Setting lo to up ..."
        ${iproute}/bin/ip -n wg link set lo up
        echo "Creating veth bridge ..."
        ${iproute}/bin/ip link add name vethwghost0 type veth peer name vethwgns0
        ${iproute}/bin/ip link set vethwgns0 netns wg
        ${iproute}/bin/ip address add 192.168.42.1/24 dev vethwghost0
        ${iproute}/bin/ip -n wg address add 192.168.42.2/24 dev vethwgns0
        ${iproute}/bin/ip link set vethwghost0 up
        ${iproute}/bin/ip -n wg link set vethwgns0 up
        echo "Creating wg0 interface ..."
        ${iproute}/bin/ip link add wg0 type wireguard
        ${wireguard-tools}/bin/wg setconf wg0 ${config.age.secrets.wireguard-config.path}
        ${iproute}/bin/ip link set wg0 netns wg
        ${iproute}/bin/ip -n wg address add 10.66.10.158/32 dev wg0
        ${iproute}/bin/ip -n wg -6 address add fc00:bbbb:bbbb:bb01::3:a9d/128 dev wg0
        ${iproute}/bin/ip -n wg link set wg0 up
        ${iproute}/bin/ip -n wg route add default dev wg0
        ${iproute}/bin/ip -n wg -6 route add default dev wg0
        echo "Done!"
      '';
      ExecStop = with pkgs; writers.writeBash "wg-down" ''
        echo "Tearing down wg0 ..."
        ${iproute}/bin/ip -n wg route del default dev wg0
        ${iproute}/bin/ip -n wg -6 route del default dev wg0
        ${iproute}/bin/ip -n wg link del wg0
        echo "Tearing down veth bridge ..."
        ${iproute}/bin/ip -n wg link del vethwgns0
        ${iproute}/bin/ip link del vethwghost0
        echo "Setting lo to down ..."
        ${iproute}/bin/ip -n wg link set lo down
        echo "Done!"
      '';
    };
  };
}
