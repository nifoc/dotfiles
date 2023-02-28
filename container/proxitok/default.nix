{ config, ... }:

{
  virtualisation.arion.projects.proxitok.settings = {
    services = {
      proxitok-web = {
        service = {
          image = "ghcr.io/pablouser1/proxitok:master";
          container_name = "proxitok-web";
          restart = "unless-stopped";
          depends_on = [ "proxitok-signer" ];
          ports = [ "127.0.0.1:8005:80" ];
          env_file = [ config.age.secrets.proxitok-environment.path ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      proxitok-signer = {
        service = {
          image = "ghcr.io/pablouser1/signtok:master";
          container_name = "proxitok-signer";
          restart = "unless-stopped";
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };
    };
  };

  services.nginx = {
    enable = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;

    virtualHosts."proxitok.only.internal" = {
      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
        }
      ];

      forceSSL = false;
      enableACME = false;

      locations."/" = {
        basicAuthFile = config.age.secrets.proxitok-auth.path;
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8005";
      };
    };
  };
}
