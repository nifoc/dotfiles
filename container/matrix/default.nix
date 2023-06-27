{ config, lib, ... }:

{
  virtualisation.oci-containers.containers = {
    # https://gitlab.com/signald/signald
    signald = {
      image = "registry.gitlab.com/signald/signald:0.23.2";
      environmentFiles = [ config.age.secrets.signald-environment.path ];
      volumes = [
        "/var/lib/matrix-bridges/signald:/signald"
      ];
    };

    # https://mau.dev/mautrix/signal
    matrix-signal = {
      image = "dock.mau.dev/mautrix/signal:v0.4.3";
      dependsOn = [ "signald" ];
      ports = [ "127.0.0.1:29328:29328" ];
      volumes = [
        "/var/lib/matrix-bridges/signal:/data"
        "/var/lib/matrix-bridges/signald:/signald"
      ];
    };

    # https://mau.dev/mautrix/whatsapp
    matrix-whatsapp = {
      image = "dock.mau.dev/mautrix/whatsapp:v0.8.6";
      ports = [ "127.0.0.1:29318:29318" ];
      volumes = [
        "/var/lib/matrix-bridges/whatsapp:/data"
      ];
    };
  };

  systemd.services = {
    podman-signald.restartTriggers = [
      "${config.age.secrets.signald-environment.file}"
    ];

    podman-matrix-signal.restartTriggers = [
      "${config.age.secrets.mautrix-signal-config.file}"
    ];

    podman-matrix-whatsapp.restartTriggers = [
      "${config.age.secrets.mautrix-whatsapp-config.file}"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/matrix-bridges/signald 0775 0 0"
    "d /var/lib/matrix-bridges/signal 0775 1337 1337"
    "d /var/lib/matrix-bridges/whatsapp 0775 1337 1337"
  ];
} 
