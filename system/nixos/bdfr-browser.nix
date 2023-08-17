{ pkgs, ... }:

let
  baseDirectory = "/mnt/media-scraper/Reddit";
  chatDirectory = "/mnt/media-scraper/RedditChat";
  workingDirectory = "/var/lib/bdfr-browser";
in
{
  systemd.services.bdfr-browser = {
    description = "A crude BDFR browser UI";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "postgresql.service" ];
    path = with pkgs; [ busybox inotify-tools ];
    serviceConfig = {
      DynamicUser = true;
      StateDirectory = "bdfr-browser";
      WorkingDirectory = workingDirectory;
      Environment = [
        "BDFR_BROWSER_BASE_DIRECTORY=${baseDirectory}"
        "BDFR_BROWSER_CHAT_DIRECTORY=${chatDirectory}"
        "BDFR_BROWSER_WATCH_DIRECTORIES=false"
        "BDFR_BROWSER_REPO_DATABASE=bdfr-browser"
        "BDFR_BROWSER_REPO_SOCKET_DIR=/run/postgresql"
        "BDFR_BROWSER_CONFIG_FILE=${workingDirectory}/config.yml"
        "RELEASE_TMP=${workingDirectory}"
        "RELEASE_DISTRIBUTION=none"
        "RELEASE_COOKIE=no_dist_anyway"
      ];
      ExecStart = "${pkgs.bdfr-browser}/bin/bdfr_browser start";
      Type = "exec";
      Restart = "on-failure";
    };
  };

  services.nginx.virtualHosts."bdfr.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:4040";
    };

    locations."/media/".alias = "${baseDirectory}/";

    locations."/chat_media/".alias = "${chatDirectory}/images/";
  };
}
