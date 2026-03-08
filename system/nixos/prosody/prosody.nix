{ pkgs, config, ... }:

let
  domain = "xmpp.kempkens.network";

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
      };

      admins = [ "daniel@xmpp.kempkens.network" ];
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
          }
        '';
      };

      muc = [
        {
          domain = "conference.${domain}";
          restrictRoomCreation = "local";
        }
      ];

      httpFileShare = {
        domain = "upload.${domain}";
        http_external_url = "https://upload.${domain}";
        access = [ "signal.${domain}" ];
      };

      extraConfig = ''
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
      '';
    };

    caddy.virtualHosts."upload.${domain}" = {
      useACMEHost = "xmpp.kempkens.network";

      extraConfig = ''
        encode

        request_body {
          max_size 128MB
        }

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        reverse_proxy 127.0.0.1:5280 {
          flush_interval -1
        }
      '';
    };
  };

  systemd.services.prosody.serviceConfig = {
    EnvironmentFile = config.age.secrets.prosody-environment.path;
  };

  networking.firewall.allowedTCPPorts = [
    5222
    5269
  ];
}
