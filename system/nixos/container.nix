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

  # It looks like there is no way to activate the "built-in" service and timer ...
  systemd.services.podman-auto-update-custom = {
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
