{ config, ... }:

{
  virtualisation.quadlet.containers.slidgnal = {
    containerConfig = {
      image = "codeberg.org/slidge/slidgnal:latest-arm64";
      exec = "--jid $SLIDGNAL_JID --secret $SLIDGNAL_SECRET";
      environmentFiles = [ config.age.secrets.prosody-environment.path ];
      volumes = [
        "/var/lib/slidge/slidgnal:/var/lib/slidge"
      ];
      networks = [ "host" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
    };

    serviceConfig = {
      EnvironmentFile = config.age.secrets.prosody-environment.path;
    };

    unitConfig = {
      Requires = [ "prosody.service" ];
      After = [ "prosody.service" ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/slidge 0750 root root"
    "d /var/lib/slidge/slidgnal 0750 10000 10000"
  ];
}
