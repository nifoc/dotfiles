{ config, ... }:

{
  virtualisation.arion.projects.nitter.settings = {
    services = {
      nitter = {
        service = {
          image = "zedeus/nitter:latest";
          container_name = "nitter";
          restart = "unless-stopped";
          ports = [ "127.0.0.1:8001:8080" ];
          environment = {
            "TZ" = "Europe/Berlin";
          };
          volumes = [
            "${config.age.secrets.nitter-config.path}:/src/nitter.conf:ro"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts."nitter.only.internal" = {
      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
        }
      ];

      forceSSL = false;
      enableACME = false;

      locations."/" = {
        basicAuthFile = config.age.secrets.nitter-auth.path;

        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8001";
      };

      locations."/pic/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8001";
      };

      locations."/video/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8001";
      };
    };
  };
}
