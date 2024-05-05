{ pkgs, config, lib, ... }:

{
  programs.yt-dlp = {
    enable = true;

    settings = {
      format = "'bestvideo+bestaudio/best'";
      # Metadata
      add-metadata = true;
      embed-subs = true;
      xattrs = true;
      # Subtitles
      write-sub = true;
      sub-format = "best";
      sub-lang = "en,de";
      # Downloader
      downloader = "aria2c";
      downloader-args = "aria2c:'--async-dns=false --max-download-limit=6M --min-split-size=1M --max-connection-per-server=4 --split=4'";
      # Other
      no-overwrites = true;
      no-call-home = true;
    };
  };

  home.packages = with pkgs; [
    aria2
    rtmpdump
  ];

  programs.fish = {
    shellAliases = {
      ytdl = "ytdl_with_options";
      ytdl_mp4 = "ytdl_with_options -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
      yti = "ytdl_with_options -F";
    };

    functions.ytdl_with_options = ''
      ${lib.getExe config.programs.yt-dlp.package} --config-location "$HOME/.config/yt-dlp/config" --download-archive "$HOME/.config/yt-dlp/archive" $argv
    '';
  };
}
