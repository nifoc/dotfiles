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
          # Other
          no-overwrites = true;
        };
      };

      zsh.shellAliases = {
        ytdl = "${ytdlExe} --config-location \"$HOME/.config/yt-dlp/config\" --download-archive \"$HOME/.config/yt-dlp/archive\"";
        ytdl_mp4 = "ytdl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
        ytdl_ig = "ytdl -f 'bestvideo*+bestaudio/best' -S 'proto,ext:mp4:m4a,res,br' --proxy socks5://argon.ts.kempkens.network:1080 --cookies \"$HOME/Downloads/cookies.txt\" --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36' --sleep-interval 10 --no-playlist";
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
