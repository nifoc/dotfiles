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
          volumes = [
            "/etc/container-proxitok/cache:/cache"
          ];
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

  systemd.tmpfiles.rules = [
    "d /etc/container-proxitok/cache 0755 33 33"
  ];

  services.nginx.virtualHosts."tictac.daniel.sx" = {
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";
    basicAuthFile = config.age.secrets.proxitok-auth.path;

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8005";
    };
  };
}
