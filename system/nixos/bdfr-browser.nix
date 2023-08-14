{ pkgs, ... }:

let
  baseDirectory = "/mnt/media-scraper/Reddit";
in
{
  systemd.services.bdfr-browser = {
    description = "A crude BDFR browser UI";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      DynamicUser = true;
      StateDirectory = "bdfr-browser";
      Environment = [
        "BDFR_BROWSER_BASE_DIRECTORY=${baseDirectory}"
        "BDFR_BROWSER_CHAT_DIRECTORY=/mnt/media-scraper/RedditChat"
        "BDFR_BROWSER_REPO_DATABASE=bdfr-browser"
        "BDFR_BROWSER_REPO_SOCKET_DIR=/run/postgresql"
        "RELEASE_DISTRIBUTION=none"
        "RELEASE_COOKIE=no_dist_anyway"
      ];
      ExecStart = "${pkgs.bdfr-browser}/bin/bdfr_browser start";
      ExecStop = "${pkgs.bdfr-browser}/bin/bdfr_browser stop";
      ExecReload = "${pkgs.bdfr-browser}/bin/bdfr_browser restart";
      Type = "notify";
      WatchdogSec = "10s";
      Restart = "on-failure";
      RestartSec = 5;
      StartLimitBurst = 3;
      StartLimitInterval = 10;
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
  };
}
