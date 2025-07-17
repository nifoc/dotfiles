{
  pkgs,
  config,
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
      ];
      hash = "sha256-57fzGmT0zYwhcoOfdn2aeV3qoJlQM1LusyeMtOKcIHA=";
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
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 2019 ];
}
