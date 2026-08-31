{
  den.aspects.cli = {
    homeManager =
      { pkgs, config, ... }:
      let
        ffmpeg = pkgs.ffmpeg;
      in
      {
        programs = {
          yt-dlp = {
            enable = true;
            package = pkgs.yt-dlp.override { ffmpeg-headless = ffmpeg; };

            settings = {
              format = "'bestvideo+bestaudio/best'";
              download-archive = "${config.home.homeDirectory}/.config/yt-dlp/archive";
              # Impersonation
              user-agent = "'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36'";
              impersonate = "chrome-146:macos-26";
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
              ffmpeg-location = "${ffmpeg}/bin";
            };
          };

          zsh.shellAliases = {
            ytdl = "yt-dlp --config-location \"$HOME/.config/yt-dlp/config\"";
            ytdl_mp4 = "ytdl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
            ytdl_ig = "ytdl -f 'bestvideo*+bestaudio/best' -S 'proto,ext:mp4:m4a,res,br' --proxy socks5://argon.ts.kempkens.network:1080 --cookies \"$HOME/Downloads/cookies.txt\" --sleep-interval 10 --no-playlist";
            yti = "ytdl -F";
          };
        };

        home.packages = with pkgs; [
          aria2
          rtmpdump
        ];
      };
  };
}
