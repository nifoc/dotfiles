{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rtmpdump
    streamlink
  ];
}
