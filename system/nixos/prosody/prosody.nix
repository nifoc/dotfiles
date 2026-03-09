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
in
{
  services = {
    prosody = {
      enable = true;
      package = pkgs.prosody.override {
        withCommunityModules = [
          "csi_battery_saver"
          "privilege"
          "sasl_ssdp"
          "sasl2"
          "sasl2_bind2"
          "sasl2_sm"
          "sasl2_fast"
        ];

        withOnlyInstalledCommunityModules = [
          "muc_notifications"
        ];

        withExtraLuaPackages = l: [ l.luadbi-postgresql ];
      };

      modules = {
        csi = false;
      };
      extraModules = [ "turn_external" ];

      admins = [ "daniel@${domain}" ];
      allowRegistration = false;

      inherit ssl;

      log = ''
        {
          { min = "warn"; to = "*syslog"; };
        }
      '';

      virtualHosts."${domain}" = {
        enabled = true;
        inherit domain ssl;

        extraConfig = ''
          privileged_entities = {
            ["signal.${domain}"] = _privileges,
            ["whatsapp.${domain}"] = _privileges,
          }
        '';
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
          "signal.${domain}"
          "whatsapp.${domain}"
        ];

        expires_after = "never";
        size_limit = 64 * 1024 * 1024;
      };

      extraConfig = ''
        c2s_direct_tls_ports = { 5223 }

        storage = "sql"
        sql = {
          driver = "PostgreSQL";
          database = "prosody";
          username = "prosody";
        }

        archive_expires_after = "never"

        turn_external_secret = Lua.os.getenv("TURN_SECRET")
        turn_external_host = "${config.services.coturn.realm}"
        turn_external_port = ${toString config.services.coturn.listening-port}
        turn_external_tls_port = ${toString config.services.coturn.tls-listening-port}

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
          component_secret = Lua.os.getenv("SLIDGNAL_SECRET")
          modules_enabled = {"privilege"}

        Component "whatsapp.${domain}"
          component_secret = Lua.os.getenv("SLIDGE_WHATSAPP_SECRET")
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

    caddy.virtualHosts."upload.${domain}" = {
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
