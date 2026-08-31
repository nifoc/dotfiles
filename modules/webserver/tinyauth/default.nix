{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.webserver.provides.tinyauth = {
    includes = with den.aspects; [
      podman
      webserver
    ];

    nixos =
      { config, ... }:
      let
        fqdn = "auth-${config.networking.hostName}.internal.kempkens.network";
        internalIP = "127.0.0.1";
        internalPort = "8099";
        dataDir = "/var/lib/tinyauth";
      in
      {
        imports = [
          inputs.agenix.nixosModules.default
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        age.secrets = {
          webserver-tinyauth-environment = {
            file = ../../../agenix/webserver/tinyauth/environment.age;
          };
        };

        virtualisation.quadlet.containers.tinyauth = {
          containerConfig = {
            image = "ghcr.io/steveiliop56/tinyauth:v5";
            publishPorts = [ "${internalIP}:${internalPort}:3000" ];
            environments = {
              TINYAUTH_APPURL = "https://${fqdn}";
              TINYAUTH_AUTH_SECURECOOKIE = "true";
              TINYAUTH_OAUTH_PROVIDERS_POCKETID_REDIRECTURL = "https://${fqdn}/api/oauth/callback/pocketid";
              TINYAUTH_ANALYTICS_ENABLED = "false";
            };
            environmentFiles = [ config.age.secrets.webserver-tinyauth-environment.path ];
            volumes = [ "${dataDir}:/data" ];
            labels = {
              "com.centurylinklabs.watchtower.enable" = "true";
              "io.containers.autoupdate" = "registry";
            };
          };
        };

        services.caddy = {
          virtualHosts."${fqdn}" = {
            extraConfig = ''
              encode

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              reverse_proxy ${internalIP}:${internalPort}
            '';
          };

          extraConfig = ''
            (tinyauth) {
              forward_auth ${internalIP}:${internalPort} {
                uri /api/auth/caddy

                copy_headers {
                  Remote-User
                  Remote-Name
                  Remote-Email
                  Remote-Groups
                }
              }
            }
          '';
        };

        systemd.tmpfiles.rules = [
          "d ${dataDir} 0750 root root"
        ];
      };
  };
}
