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

  programs.fish = {
    shellAliases = {
      ytdl = "ytdl_with_options";
      ytdl_mp4 = "ytdl_with_options -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
      yti = "ytdl_with_options -F";
    };

    functions.ytdl_with_options = ''
      yt-dlp --config-location "$HOME/.config/yt-dlp/config" --download-archive "$HOME/.config/yt-dlp/archive" $argv
    '';
  };
}
