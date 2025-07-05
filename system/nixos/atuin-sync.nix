{ config, ... }:

{
  services = {
    atuin = {
      enable = true;

      host = "127.0.0.1";
      port = 8015;
      openRegistration = false;
      openFirewall = false;
    };

    caddy.virtualHosts."atuin-sync.kempkens.io" = {
      listenAddresses = [
        "100.97.247.57"
        "[fd7a:115c:a1e0::8a01:f739]"
      ];

      useACMEHost = "kempkens.io";

      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"

        reverse_proxy ${config.services.atuin.host}:${toString config.services.atuin.port}
      '';
    };
  };
}
