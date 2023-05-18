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
        "RELEASE_DISTRIBUTION=none"
        "RELEASE_COOKIE=no_dist_anyway"
      ];
      ExecStart = "${pkgs.bdfr-browser}/bin/bdfr_browser start";
      Type = "notify";
      WatchdogSec = "10s";
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
  };
}
