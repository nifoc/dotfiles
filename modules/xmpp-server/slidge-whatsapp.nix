{ den, ... }:

{
  den.aspects.xmpp-server = {
    includes = with den.aspects; [
      podman
    ];

    nixos =
      { config, ... }:
      let
        xmppCfg = den.aspects.${config.networking.hostName}.meta.xmpp-server;

        inherit (xmppCfg) domain;
      in
      {
        virtualisation.quadlet.containers.slidge-whatsapp = {
          containerConfig = {
            image = "codeberg.org/slidge/slidge-whatsapp:latest-arm64";
            exec = "--jid whatsapp.${domain} --secret $SLIDGE_WHATSAPP_SECRET";
            environments = {
              SLIDGE_MAM_MAX_DAYS = "3650";
            };
            environmentFiles = [ config.age.secrets.xmpp-server-prosody-environment.path ];
            volumes = [
              "/var/lib/slidge/whatsapp:/var/lib/slidge"
            ];
            networks = [ "host" ];
            labels = {
              "com.centurylinklabs.watchtower.enable" = "true";
              "io.containers.autoupdate" = "registry";
            };
          };

          serviceConfig = {
            EnvironmentFile = config.age.secrets.xmpp-server-prosody-environment.path;
          };

          unitConfig = {
            Requires = [ "prosody.service" ];
            After = [ "prosody.service" ];
          };
        };

        systemd.tmpfiles.rules = [
          "d /var/lib/slidge 0750 root root"
          "d /var/lib/slidge/whatsapp 0750 10000 10000"
        ];
      };
  };
}
