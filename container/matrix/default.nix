{ config, lib, ... }:

{
  virtualisation.oci-containers.containers = {
    # https://gitlab.com/signald/signald
    signald = {
      image = "registry.gitlab.com/signald/signald:0.23.2";
      environmentFiles = [ config.age.secrets.signald-environment.path ];
      volumes = [
        "/etc/container-matrix/signald:/signald"
      ];
      extraOptions = [
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };

    # https://mau.dev/mautrix/signal
    matrix-signal = {
      image = "dock.mau.dev/mautrix/signal:v0.4.2";
      dependsOn = [ "signald" ];
      ports = [ "127.0.0.1:29328:29328" ];
      volumes = [
        "/etc/container-matrix/signal:/data"
        "/etc/container-matrix/signald:/signald"
      ];
      extraOptions = [
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };

    # https://mau.dev/mautrix/whatsapp
    matrix-whatsapp = {
      image = "dock.mau.dev/mautrix/whatsapp:v0.8.4";
      ports = [ "127.0.0.1:29318:29318" ];
      volumes = [
        "/etc/container-matrix/whatsapp:/data"
      ];
      extraOptions = [
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };
  };

  systemd.services.podman-signald.serviceConfig = {
    TimeoutStopSec = lib.mkForce 5;
  };

  systemd.services.podman-matrix-signal.serviceConfig = {
    TimeoutStopSec = lib.mkForce 5;
  };

  systemd.services.podman-matrix-whatsapp.serviceConfig = {
    TimeoutStopSec = lib.mkForce 5;
  };

  networking.firewall.interfaces."podman+" = {
    allowedUDPPorts = [ 443 ];
    allowedTCPPorts = [ 443 ];
  };

  systemd.tmpfiles.rules = [
    "d /etc/container-matrix/signald 0775 0 0"
    "d /etc/container-matrix/signal 0775 1337 1337"
    "d /etc/container-matrix/whatsapp 0775 1337 1337"
  ];

  # Matrix: Signal

  environment.etc."container-matrix/signal/config.yaml" = {
    source = ../../secret/container/matrix/config/signal.yaml;
    mode = "0640";
    uid = 1337;
    gid = 1337;
  };

  # Matrix: WhatsApp

  environment.etc."container-matrix/whatsapp/config.yaml" = {
    source = ../../secret/container/matrix/config/whatsapp.yaml;
    mode = "0640";
    uid = 1337;
    gid = 1337;
  };
} 
