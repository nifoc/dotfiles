{
  pkgs,
  lib,
  ...
}:

let
  server_name = "kempkens.io";
  fqdn = "matrix.${server_name}";

  user = "conduwuit";
  group = "conduwuit";

  cfg = {
    global = {
      inherit server_name;
      address = [
        "127.0.0.1"
        "::1"
      ];
      port = [ 6167 ];
      unix_socket_perms = 660;

      database_path = "/var/lib/conduwuit/";

      max_request_size = 20000000;

      allow_registration = false;
      allow_federation = true;
      allow_encryption = true;
      allow_check_for_updates = false;

      trusted_servers = [ "matrix.org" ];

      allow_legacy_media = false;

      url_preview_bound_interface = "eth0";

      new_user_displayname_suffix = "";
    };
  };

  format = pkgs.formats.toml { };
  configFile = format.generate "tuwunel.toml" cfg;
in
{
  users.users."${user}" = {
    inherit group;
    home = cfg.global.database_path;
    isSystemUser = true;
  };

  users.groups."${group}" = { };

  systemd.services.conduwuit = {
    description = "Tuwunel Matrix Server";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    environment = {
      CONDUWUIT_CONFIG = configFile;
    };
    startLimitBurst = 5;
    startLimitIntervalSec = 60;
    serviceConfig = {
      DynamicUser = true;
      User = user;
      Group = group;

      DevicePolicy = "closed";
      LockPersonality = true;
      MemoryDenyWriteExecute = true;
      NoNewPrivileges = true;
      ProtectClock = true;
      ProtectControlGroups = true;
      ProtectHome = true;
      ProtectHostname = true;
      ProtectKernelLogs = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      PrivateDevices = true;
      PrivateMounts = true;
      PrivateTmp = true;
      PrivateUsers = true;
      PrivateIPC = true;
      RemoveIPC = true;
      RestrictAddressFamilies = [
        "AF_INET"
        "AF_INET6"
        "AF_UNIX"
      ];
      RestrictNamespaces = true;
      RestrictRealtime = true;
      SystemCallArchitectures = "native";
      SystemCallFilter = [
        "@system-service @resources"
        "~@clock @debug @module @mount @reboot @swap @cpu-emulation @obsolete @timer @chown @setuid @privileged @keyring @ipc"
      ];
      SystemCallErrorNumber = "EPERM";

      StateDirectory = "conduwuit";
      StateDirectoryMode = "0700";
      RuntimeDirectory = "conduwuit";
      RuntimeDirectoryMode = "0750";

      ExecStart = lib.getExe pkgs.tuwunel;
      Restart = "on-failure";
      RestartSec = 10;
    };
  };

  services = {
    caddy.virtualHosts =
      let
        wellKnown = ''
          header /.well-known/matrix/server {
            Content-Type "application/json"
            Access-Control-Allow-Origin "*"
          }

          respond /.well-known/matrix/server <<JSON
            {"m.server": "${fqdn}:443"}
            JSON 200

          header /.well-known/matrix/client {
            Content-Type "application/json"
            Access-Control-Allow-Origin "*"
          }

          respond /.well-known/matrix/client <<JSON
            {
              "m.server": {"base_url": "https://${fqdn}"},
              "m.homeserver": {"base_url": "https://${fqdn}"},
              "org.matrix.msc3575.proxy": {"url": "https://${fqdn}"}
            }
            JSON 200

          header /.well-known/matrix/support {
            Content-Type "application/json"
            Access-Control-Allow-Origin "*"
          }

          respond /.well-known/matrix/support <<JSON
            {
              "contacts": [{
                "role": "m.role.admin",
                "matrix_id": "@daniel:kempkens.io",
                "email_address": "daniel@kempkens.io"
              }]
            }
            JSON 200
        '';
      in
      {
        "${server_name}".extraConfig = wellKnown;

        "${fqdn}" = {
          useACMEHost = "kempkens.io";

          extraConfig = ''
            encode

            request_body {
              max_size 20MB
            }

            header {
              Permissions-Policy interest-cohort=()
              >Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
              X-Content-Type-Options nosniff
              X-Frame-Options DENY
              X-XSS-Protection "1; mode=block"

              +X-Robots-Tag "noindex, nofollow"
              +X-Robots-Tag "noai, noimageai"
            }

            header / {
              Content-Type "text/plain"
            }

            respond / "uwu ~" 200

            ${wellKnown}

            handle /robots.txt {
              rewrite * robots_generic.txt
              root * ${pkgs.ai-robots-txt}/share
              file_server
            }

            @tuwunel {
              path /_matrix/*
              path /_conduwuit/*
            }

            reverse_proxy @tuwunel 127.0.0.1:${toString (builtins.elemAt cfg.global.port 0)}
          '';
        };
      };
  };
}
