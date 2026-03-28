{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ethtool
    ldns
    lm_sensors
    openseachest
    smartmontools
    tcpdump
    trippy
  ];
}
