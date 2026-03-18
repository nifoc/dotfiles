{
  pkgs,
  config,
  lib,
  domain,
  ...
}:

let
  ssl = {
    cert = "/var/lib/prosody/xmpp-fullchain.pem";
    key = "/var/lib/prosody/xmpp-key.pem";
  };

  ntfyDomain = "ntfy.${domain}";
in
{
  services = {
    prosody = {
      enable = true;
      package = pkgs.prosody.override {
        withCommunityModules = [
          "csi_battery_saver"
          "muc_notifications"
          "privilege"
          "sasl_ssdp"
          "sasl2"
          "sasl2_bind2"
          "sasl2_sm"
          "sasl2_fast"
        ];

        withOnlyInstalledCommunityModules = [ "rest" ];

        withExtraLuaPackages = l: [ l.luadbi-postgresql ];
      };

      extraModules = [
        "presence_cache"
        "turn_external"
      ];

      admins = [ "daniel@${domain}" ];
      allowRegistration = false;

      inherit ssl;

      log = ''
        {
          { min = "warn"; to = "*syslog"; };
        }
      '';

      virtualHosts = {
        main = {
          enabled = true;
          inherit domain ssl;

          extraConfig = ''
            privileged_entities = {
              ["signal.${domain}"] = _privileges,
              ["whatsapp.${domain}"] = _privileges,
            }
          '';
        };

        ntfy = {
          enabled = true;
          domain = ntfyDomain;
          inherit ssl;

          extraConfig = ''
            modules_enabled = {"rest"}
          '';
        };
      };

      muc = [
        {
          domain = "conference.${domain}";
          name = "${domain} Chatrooms";
          restrictRoomCreation = "local";
          roomDefaultPublic = false;
          roomDefaultMembersOnly = true;
          roomDefaultChangeSubject = true;
        }
      ];

      httpFileShare = {
        domain = "upload.${domain}";
        http_external_url = "https://upload.${domain}";
        access = [
          domain
          ntfyDomain
          "signal.${domain}"
          "whatsapp.${domain}"
        ];

        expires_after = "1 week";
        size_limit = 64 * 1024 * 1024;
      };

      extraConfig = ''
        c2s_direct_tls_ports = { 5223 }
        tls_profile = "modern"

        storage = "sql"
        sql = {
          driver = "PostgreSQL";
          database = "prosody";
          username = "prosody";
        }

        default_archive_policy = true
        archive_expires_after = "1w"

        smacks_hibernation_time = 86400
        smacks_max_queue_size = 1000

        turn_external_secret = ENV_TURN_SECRET
        turn_external_host = "${config.services.coturn.realm}"
        turn_external_port = ${toString config.services.coturn.listening-port}
        turn_external_tls_port = ${toString config.services.coturn.tls-listening-port}

        unbound = {
          trustfile = "${pkgs.dns-root-data}/root.ds";
        }

        local _privileges = {
          roster = "both";
          message = "outgoing";
          iq = {
            ["http://jabber.org/protocol/pubsub"] = "both";
            ["http://jabber.org/protocol/pubsub#owner"] = "set";
            ["urn:xmpp:http:upload:0"] = "get";
          };
        }

        Component "signal.${domain}"
          component_secret = ENV_SLIDGNAL_SECRET
          modules_enabled = {"privilege"}

        Component "whatsapp.${domain}"
          component_secret = ENV_SLIDGE_WHATSAPP_SECRET
          modules_enabled = {"privilege"}
      '';
    };

    postgresql = {
      ensureDatabases = [ "prosody" ];
      ensureUsers = [
        {
          name = "prosody";
          ensureDBOwnership = true;
        }
      ];
    };

    postgresqlBackup.databases = [ "prosody" ];

    caddy.virtualHosts = {
      "upload.${domain}" = {
        useACMEHost = domain;

        extraConfig = ''
          encode

          request_body {
            max_size ${toString config.services.prosody.httpFileShare.size_limit}
          }

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          reverse_proxy 127.0.0.1:5280 {
            flush_interval -1
          }
        '';
      };

      "ntfy.${domain}" = {
        useACMEHost = domain;

        extraConfig = ''
          encode

          request_body {
            max_size 1MB
          }

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          respond / "uwu ~" 200

          @mod_rest {
            path /rest
            path /rest/*
          }

          reverse_proxy @mod_rest 127.0.0.1:5280
        '';
      };
    };
  };

  systemd.services.prosody = {
    after = lib.mkAfter [ "postgresql.target" ];
    requires = lib.mkAfter [ "postgresql.target" ];

    serviceConfig = {
      EnvironmentFile = config.age.secrets.prosody-environment.path;
    };
  };

  networking.firewall.allowedTCPPorts = [
    5222
    5223
    5269
  ];
}
