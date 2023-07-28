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
    allowedUDPPorts = [ 53 443 ];
    allowedTCPPorts = [ 53 443 5432 ];
  };

  # For services that listen on podman0
  systemd.services.podman-wait-for-host-interface = {
    description = "Wait for podman0 to be available";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'until ${pkgs.iproute2}/bin/ip address show podman0; do sleep 1; done'";
    };
  };

  # It looks like there is no way to activate the "built-in" service and timer ...
  systemd.services.podman-auto-update-custom = {
    enable = false;

    description = "Run podman auto-update daily";
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    startAt = "daily";

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
}
