{ pkgs, lib, ... }:

{
  programs =
    let
      ytdlPackage = pkgs.yt-dlp;
      ytdlExe = lib.getExe ytdlPackage;
    in
    {
      yt-dlp = {
        enable = true;
        package = ytdlPackage;

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

      zsh.shellAliases = {
        ytdl = "${ytdlExe} --config-location \"$HOME/.config/yt-dlp/config\" --download-archive \"$HOME/.config/yt-dlp/archive\"";
        ytdl_mp4 = "ytdl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
        yti = "ytdl -F";
      };

      fish = {
        shellAliases = {
          ytdl = "ytdl_with_options";
          ytdl_mp4 = "ytdl_with_options -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
          yti = "ytdl_with_options -F";
        };

        functions.ytdl_with_options = ''
          ${ytdlExe} --config-location "$HOME/.config/yt-dlp/config" --download-archive "$HOME/.config/yt-dlp/archive" $argv
        '';
      };
    };

  home.packages = with pkgs; [
    aria2
    rtmpdump
  ];
}
