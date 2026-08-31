{
  den.aspects.podman = {
    nixos =
      { config, ... }:
      {
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
              ExecStartPost = "${podman}/bin/podman image prune -f --filter=label!=io.kempkens.keepImage";
            };
        };
      };
  };
}
