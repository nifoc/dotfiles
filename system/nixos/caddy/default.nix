{ pkgs, config, ... }:

{
  imports = [
    ./argon.nix
    ./boron.nix
    ./carbon.nix
    ./krypton.nix
    ./neon.nix
  ];

  services.caddy = {
    enable = true;

    package = pkgs.caddy.withPlugins {
      plugins = [
        "github.com/caddy-dns/ovh@v0.0.0-20250519141359-17fd665136b5"
        "github.com/yroc92/postgres-storage@v0.0.0-20230310195636-276797aefe40"
      ];
      hash = "sha256-MyDDPtcAnIMta2FUlKrFgMR/KVuhsT3yAXplHD0H9C0=";
    };

    environmentFile = config.age.secrets.caddy-environment.path;

    globalConfig = ''
      admin :2019

      metrics {
        per_host
      }

      storage postgres {
        host {$STORAGE_POSTGRES_HOST}
        port {$STORAGE_POSTGRES_PORT}
        user {$STORAGE_POSTGRES_USER}
        password {$STORAGE_POSTGRES_PASSWORD}
        dbname {$STORAGE_POSTGRES_DATABASE}
        sslmode disable
        disable_ddl false
      }

      acme_dns ovh {
        endpoint {$DNS_OVH_ENDPOINT}
        application_key {$DNS_OVH_APPLICATION_KEY}
        application_secret {$DNS_OVH_APPLICATION_SECRET}
        consumer_key {$DNS_OVH_CONSUMER_KEY}
      }
    '';
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 2019 ];
}
