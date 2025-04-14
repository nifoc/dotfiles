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
    nginx.virtualHosts =
      let
        wellKnown = {
          "/.well-known/matrix/server" = {
            return = "200 '{\"m.server\": \"${fqdn}:443\"}'";

            extraConfig = ''
              default_type application/json;
              more_set_headers 'Access-Control-Allow-Origin: "*"';
            '';
          };

          "/.well-known/matrix/client" = {
            return = "200 '{\"m.server\": {\"base_url\": \"https://${fqdn}\"}, \"m.homeserver\": {\"base_url\": \"https://${fqdn}\"}, \"org.matrix.msc3575.proxy\": {\"url\": \"https://${fqdn}\"}}'";

            extraConfig = ''
              default_type application/json;
              more_set_headers 'Access-Control-Allow-Origin: "*"';
            '';
          };

          "/.well-known/matrix/support" = {
            return = "200 '{\"contacts\": [{\"role\": \"m.role.admin\", \"matrix_id\": \"@daniel:kempkens.io\", \"email_address\": \"daniel@kempkens.io\"}]}'";

            extraConfig = ''
              default_type application/json;
              more_set_headers 'Access-Control-Allow-Origin: "*"';
            '';
          };
        };
      in
      {
        "${server_name}".locations = wellKnown;

        "${fqdn}" = {
          quic = true;
          http3 = true;

          forceSSL = true;
          useACMEHost = "kempkens.io";

          extraConfig = ''
            access_log /var/log/nginx/access_${fqdn}.log combined_vhost buffer=32k flush=5m;

            client_max_body_size 20m;

            add_header Alt-Svc 'h3=":443"; ma=86400';
            add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
            add_header X-Content-Type-Options nosniff;
            add_header X-Frame-Options DENY;
            add_header X-XSS-Protection "1; mode=block";
          '';

          locations = {
            "= /" = {
              return = "200 'uwu~'";

              extraConfig = ''
                default_type text/plain;
              '';
            };

            "= /robots.txt".alias = "${pkgs.ai-robots-txt}/share/robots_generic.txt";

            "~* ^(\/_matrix|\/_conduwuit)" = {
              recommendedProxySettings = true;
              proxyPass = "http://127.0.0.1:${toString (builtins.elemAt cfg.global.port 0)}";

              extraConfig = ''
                proxy_http_version 1.1;
                proxy_read_timeout 60s;
                proxy_send_timeout 60s;
              '';
            };
          } // wellKnown;
        };
      };
  };
}
