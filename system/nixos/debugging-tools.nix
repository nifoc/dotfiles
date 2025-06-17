{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ldns
    tcpdump
    trippy
  ];
}
