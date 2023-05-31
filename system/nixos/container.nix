{ pkgs, config, ... }:

{
  virtualisation = {
    docker.enable = false;

    podman = {
      enable = true;

      defaultNetwork.settings.dns_enabled = true;

      dockerSocket.enable = false;
      dockerCompat = false;

      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = [ "--all" ];
      };
    };

    oci-containers = {
      backend = "podman";
    };
  };

  networking.firewall.interfaces."podman+" = {
    allowedUDPPorts = [ 53 ];
    allowedTCPPorts = [ 53 ];
  };

  # It looks like there is no way to activate the "built-in" service and timer ...
  systemd.services.podman-auto-update-custom = {
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];

    serviceConfig =
      let
        podman = config.virtualisation.podman.package;
      in
      {
        Type = "oneshot";
        ExecStart = "${podman}/bin/podman auto-update";
        ExecStartPost = "${podman}/bin/podman image prune -f";
      };
  };

  systemd.timers.podman-auto-update-custom = {
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "daily";
      RandomizedDelaySec = 900;
      Persistent = true;
    };
  };
}
