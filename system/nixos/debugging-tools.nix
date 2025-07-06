{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ethtool
    ldns
    openseachest
    smartmontools
    tcpdump
    trippy
  ];
}
