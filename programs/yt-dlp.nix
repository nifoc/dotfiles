{ pkgs, ... }:

{
  home.packages = [ pkgs.yt-dlp ];

  xdg.configFile.yt-dlp = {
    source = ../config/yt-dlp;
    recursive = true;
  };
}
