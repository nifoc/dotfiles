{ pkgs, ... }:

{
  home.packages = with pkgs; [
    atomicparsley
    rtmpdump
    yt-dlp
  ];

  xdg.configFile.yt-dlp = {
    source = ../config/yt-dlp;
    recursive = true;
  };
}
