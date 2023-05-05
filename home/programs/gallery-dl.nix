{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gallery-dl
    ffmpeg
  ];
}
