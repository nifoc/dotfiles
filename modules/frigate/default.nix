{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    disko.url = "github:nix-community/disko";
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.frigate = {
    nixos =
      { config, ... }:
      let
        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;
      in
      {
        imports = [
          inputs.agenix.nixosModules.default
          inputs.disko.nixosModules.disko
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        age.secrets = {
          frigate-environment = {
            file = ../../agenix/frigate/environment.age;
          };
        };

        disko.devices.zpool.zroot.datasets = {
          "root/services/frigate" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/frigate";
              atime = "off";
            };
            mountpoint = "/var/lib/frigate";
          };
        };

        virtualisation.quadlet.containers.frigate = {
          containerConfig = {
            image = "ghcr.io/blakeblackshear/frigate:0.18.0";
            environments = {
              TZ = "Europe/Berlin";
            };
            environmentFiles = [ config.age.secrets.frigate-environment.path ];
            devices = [
              "/dev/dri:/dev/dri"
            ];
            volumes = [
              "/var/lib/frigate/config:/config"
              "/var/lib/frigate/clips:/media/frigate/clips"
              "/var/lib/frigate/recordings:/media/frigate/recordings"
              "/var/lib/frigate/exports:/media/frigate/exports"
              "/var/cache/frigate:/tmp/cache"
            ];
            networks = [ "host" ];

            shmSize = "512mb";
            stopTimeout = 30;
            podmanArgs = [ "--privileged" ];
          };
        };

        networking.firewall.interfaces =
          let
            sharedRules = {
              allowedTCPPorts = [
                1984
                8554
                8555
              ];
              allowedUDPPorts = [
                8554
                8555
              ];
            };
          in
          {
            "${networkConfig.default.name}" = sharedRules;
            "${networkConfig.tailscale.name}" = sharedRules;
          };
      };
  };
}
