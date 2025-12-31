{
  pkgs,
  config,
  lib,
  ...
}:

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
        "github.com/caddy-dns/desec@v0.0.0-20250422185948-3a2346e88559"
        "github.com/yroc92/postgres-storage@v0.0.0-20230310195636-276797aefe40"
        "github.com/porech/caddy-maxmind-geolocation@v0.0.0-20250305164927-9066f91c9696"
      ];
      hash = "sha256-r6mFTQycE5Ct8+cVGKJu6MCEyML7I4vO9pleGOnh4WQ=";
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

      dns desec {
        token {$DNS_DESEC_TOKEN}
      }

      cert_issuer acme {
        dns desec {
          token {$DNS_DESEC_TOKEN}
        }

        propagation_delay 5m
        resolvers ns1.desec.io ns2.desec.org
      }
    '';

    extraConfig = ''
      (robots-txt-ai) {
        header +X-Robots-Tag "noai, noimageai"

        handle /robots.txt {
          root * ${pkgs.ai-robots-txt}/share
          file_server
        }
      }

      (robots-txt-generic) {
        header {
          +X-Robots-Tag "noindex, nofollow"
          +X-Robots-Tag "noai, noimageai"
        }

        handle /robots.txt {
          rewrite * robots_generic.txt
          root * ${pkgs.ai-robots-txt}/share
          file_server
        }
      }
    '';
  };

  systemd.services.caddy = {
    requires = lib.mkAfter [ "tailscale-wait-up.service" ];
    after = lib.mkAfter [ "tailscale-wait-up.service" ];
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 2019 ];
}
