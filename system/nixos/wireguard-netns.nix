{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ wireguard-tools ];

  systemd.services."netns@" = {
    description = "%I network namespace";
    before = [ "network.target" ];
    after = [ "run-agenix.d.mount" ];
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
    after = [ "netns@wg.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = with pkgs; writers.writeBash "wg-up" ''
        set -e
        echo "Creating interface ..."
        ${iproute}/bin/ip link add wg0 type wireguard
        echo "Configuring wg0 ..."
        ${wireguard-tools}/bin/wg setconf wg0 ${config.age.secrets.wireguard-config.path}
        ${iproute}/bin/ip link set wg0 netns wg
        ${iproute}/bin/ip -n wg address add 10.66.10.158/32 dev wg0
        ${iproute}/bin/ip -n wg -6 address add fc00:bbbb:bbbb:bb01::3:a9d/128 dev wg0
        ${iproute}/bin/ip -n wg link set lo up
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
        ${iproute}/bin/ip -n wg link set lo down
        echo "Done!"
      '';
    };
  };
}
