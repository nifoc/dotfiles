{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";

    nifoc-overlay.url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";
  };

  den.aspects.webserver = {
    nixos =
      {
        pkgs,
        config,
        lib,
        inputs',
        ...
      }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        inherit (cfg.firewall) trustedInterfaces;

        defaultDomain = if cfg.webserver.internal then "internal.kempkens.network" else "kempkens.network";

        defaultSNI =
          if cfg.webserver.internal then
            "default-${config.networking.hostName}.${defaultDomain}"
          else
            "default.${defaultDomain}";

        echConfig =
          if cfg.webserver.ech then "ech ech-${config.networking.hostName}.${defaultDomain}" else "";
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          webserver-caddy-environment = {
            file = ../../../agenix/webserver/caddy/environment.age;
          };
        };

        services.caddy = {
          enable = true;

          package = pkgs.caddy.withPlugins {
            plugins = [
              "github.com/caddy-dns/desec@v0.0.0-20260210205102-325e2faf7910"
              "github.com/yroc92/postgres-storage@v0.0.0-20230310195636-276797aefe40"
              "github.com/porech/caddy-maxmind-geolocation@v0.0.0-20250305164927-9066f91c9696"
              "pkg.jsn.cam/caddy-defender@v0.10.0"
            ];
            hash = "sha256-dMun9UkhS6iO2aCJ5dJYbM0RCKrwkk7Y4qi+KcG0JFs=";
          };

          environmentFile = config.age.secrets.webserver-caddy-environment.path;

          globalConfig = ''
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

            servers {
              protocols ${cfg.webserver.protocols or "h1 h2 h3"}
            }

            default_sni ${defaultSNI}
            ${echConfig}
          '';

          extraConfig =
            let
              inherit (inputs'.nifoc-overlay.packages) ai-robots-txt;
            in
            ''
              (robots-txt-ai) {
                header +X-Robots-Tag "noai, noimageai"

                handle /robots.txt {
                  root * ${ai-robots-txt}/share
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
                  root * ${ai-robots-txt}/share
                  file_server
                }
              }
            '';

          virtualHosts = builtins.listToAttrs (
            builtins.map (host: {
              name = host;
              value = {
                extraConfig = ''
                  respond "I'm a teapot" 418
                '';
              };
            }) ([ "*.${defaultDomain}" ] ++ cfg.webserver.extraDefaultHosts)
          );
        };

        systemd.services.caddy = lib.mkIf config.services.tailscale.enable {
          requires = lib.mkAfter [ "tailscale-wait-up.service" ];
          after = lib.mkAfter [ "tailscale-wait-up.service" ];
        };

        networking.firewall.interfaces =
          let
            interfaces =
              lib.mapAttrsToList (
                _: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null
              ) config.systemd.network.networks
              ++ trustedInterfaces;
          in
          builtins.listToAttrs (
            builtins.map (iface: {
              name = iface;
              value = {
                allowedTCPPorts = [
                  80
                  443
                ];
                allowedUDPPorts = [ 443 ];
              };
            }) (builtins.filter builtins.isString interfaces)
          );
      };
  };
}
