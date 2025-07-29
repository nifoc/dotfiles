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
      hash = "sha256-4jy6vUl66ANKWT6UWezAx6UcyZDShU4o+bBvWW0OUSs=";
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

      acme_dns desec {
        token {$DNS_DESEC_TOKEN}
      }

      dns desec {
        token {$DNS_DESEC_TOKEN}
      }
    '';

    extraConfig = ''
      (robots-txt-ai) {
        handle /robots.txt {
          root * ${pkgs.ai-robots-txt}/share
          file_server
        }
      }

      (robots-txt-generic) {
        handle /robots.txt {
          rewrite * robots_generic.txt
          root * ${pkgs.ai-robots-txt}/share
          file_server
        }
      }
    '';
  };

  systemd.services.caddy = {
    requires = lib.mkAfter [ "tailscaled.service" ];
    after = lib.mkAfter [ "tailscaled.service" ];
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 2019 ];
}
