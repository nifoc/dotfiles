{ config, ... }:

let
  proxy-no-auth = {
    recommendedProxySettings = true;
    proxyPass = "http://127.0.0.1:8001";
  };
in
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

      # Disable auth for certain paths
      locations."/pic/" = proxy-no-auth;
      locations."/video/" = proxy-no-auth;
      locations."/favicon.ico" = proxy-no-auth;
      locations."/favicon-32x32.png" = proxy-no-auth;
      locations."/favicon-16x16.png" = proxy-no-auth;
      locations."/apple-touch-icon.png" = proxy-no-auth;
    };
  };
}
