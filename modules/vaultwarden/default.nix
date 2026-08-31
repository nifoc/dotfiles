{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    disko.url = "github:nix-community/disko";
  };

  den.aspects.vaultwarden = {
    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        fqdn = "vault.kempkens.network";
      in
      {
        imports = [
          inputs.agenix.nixosModules.default
          inputs.disko.nixosModules.disko
        ];

        age.secrets = {
          vaultwarden-config = {
            file = ../../agenix/vaultwarden/config.age;
          };
        };

        disko.devices.zpool.zroot.datasets = {
          "root/services/vaultwarden" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/bitwarden_rs";
              atime = "off";
            };
            mountpoint = "/var/lib/bitwarden_rs";
          };
        };

        services = {
          vaultwarden = {
            enable = true;
            package = pkgs.veryUnstable.vaultwarden;
            dbBackend = "postgresql";

            environmentFile = config.age.secrets.vaultwarden-config.path;
            config = {
              DOMAIN = "https://${fqdn}";
              SIGNUPS_ALLOWED = false;
              EXPERIMENTAL_CLIENT_FEATURE_FLAGS = "ssh-key-vault-item,ssh-agent";

              ROCKET_ADDRESS = "127.0.0.1";
              ROCKET_PORT = 8222;

              DATABASE_URL = "postgresql:///vaultwarden?host=/run/postgresql";

              USE_SENDMAIL = true;
              SMTP_FROM = "server@kempkens.email";
              SENDMAIL_COMMAND = "${pkgs.system-sendmail}/bin/sendmail";

              PUSH_ENABLED = true;

              ENFORCE_SINGLE_ORG_WITH_RESET_PW_POLICY = true;
            };
          };

          postgresql = {
            ensureDatabases = [ "vaultwarden" ];

            ensureUsers = [
              {
                name = "vaultwarden";
                ensureDBOwnership = true;
              }
            ];
          };

          postgresqlBackup.databases = [ "vaultwarden" ];

          restic.backups = lib.mkMerge [
            { remote.paths = [ "/var/lib/bitwarden_rs" ]; }

            (lib.mkIf (builtins.hasAttr "restic-secondary-password" config.age.secrets) {
              secondary.paths = [ "/var/lib/bitwarden_rs" ];
            })
          ];

          caddy.virtualHosts."${fqdn}" = {
            extraConfig = ''
              defender custom {
                ranges aliyun aws azurepubliccloud gcloud huawei linode oci vultr
                message "no clouds pls"
                status_code 403
              }

              encode

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              import robots-txt-generic

              handle {
                import geoblock-common

                request_body {
                  max_size 40MB
                }

                reverse_proxy ${config.services.vaultwarden.config.ROCKET_ADDRESS}:${toString config.services.vaultwarden.config.ROCKET_PORT} {
                  header_up X-Real-IP {remote_host}
                }
              }
            '';
          };
        };

        systemd.services.vaultwarden = {
          requires = [ "postgresql.service" ];
          after = [ "postgresql.service" ];
          restartTriggers = [ "${config.age.secrets.vaultwarden-config.file}" ];
        };
      };
  };
}
