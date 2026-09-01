{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    niks3.url = "github:Mic92/niks3";
  };

  den.aspects.nix-cache = {
    nixos =
      { config, ... }:
      let
        fqdn = "niks3-cache.kempkens.network";
      in
      {
        imports = [
          inputs.agenix.nixosModules.default
          inputs.niks3.nixosModules.niks3
        ];

        age.secrets = {
          nix-cache-niks3-access-key = {
            file = ../../agenix/nix-cache/niks3-access-key.age;
            owner = "niks3";
            group = "niks3";
          };

          nix-cache-niks3-secret-key = {
            file = ../../agenix/nix-cache/niks3-secret-key.age;
            owner = "niks3";
            group = "niks3";
          };

          nix-cache-niks3-api-token = {
            file = ../../agenix/nix-cache/niks3-api-token.age;
            owner = "niks3";
            group = "niks3";
          };

          nix-cache-niks3-sign-key = {
            file = ../../agenix/nix-cache/niks3-sign-key.age;
            owner = "niks3";
            group = "niks3";
          };
        };

        services = {
          niks3 = {
            enable = true;

            s3 = {
              endpoint = "s3.de.io.cloud.ovh.net";
              bucket = "nifoc-niks3-cache";
              region = "de";
              accessKeyFile = config.age.secrets.nix-cache-niks3-access-key.path;
              secretKeyFile = config.age.secrets.nix-cache-niks3-secret-key.path;
            };

            apiTokenFile = config.age.secrets.nix-cache-niks3-api-token.path;

            signKeyFiles = [
              config.age.secrets.nix-cache-niks3-sign-key.path
            ];

            maxNarSize = "2G";
            priority = 45;

            cacheUrl = "https://${fqdn}";

            readProxy = {
              enable = true;
              redirectTTL = "15m";
            };

            oidc.providers = {
              github = {
                issuer = "https://token.actions.githubusercontent.com";
                audience = "https://${fqdn}";
                boundClaims = {
                  repository_owner = [ "nifoc" ];
                  ref = [ "refs/heads/master" ];
                };
              };
            };
          };

          caddy.virtualHosts."${fqdn}" = {
            extraConfig = ''
              request_body {
                max_size 2GB
              }

              @niks3_api {
                not path /api/*
              }

              basic_auth @niks3_api argon2id "niks3-cache" {
                daniel {$BASIC_AUTH_NIKS3_DANIEL_PASSWORD}
              }

              reverse_proxy ${config.services.niks3.httpAddr} {
                flush_interval -1
              }
            '';
          };
        };
      };
  };
}
