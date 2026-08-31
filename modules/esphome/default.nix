{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.esphome = {
    includes = with den.aspects; [
      podman
    ];

    nixos =
      { config, ... }:
      let
        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;
        internalIP = networkConfig.tailscale.ipv4;
        dataDir = "/var/lib/esphome";
      in
      {
        imports = [
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        virtualisation.quadlet.containers.esphome = {
          containerConfig = {
            image = "ghcr.io/esphome/esphome:stable";
            publishPorts = [
              "${internalIP}:6052:6052"
              "${internalIP}:6055:6055"
            ];
            volumes = [ "${dataDir}/config:/config" ];
            labels = {
              "com.centurylinklabs.watchtower.enable" = "true";
              "io.containers.autoupdate" = "registry";
            };
          };
        };

        systemd.tmpfiles.rules = [
          "d ${dataDir} 0750 root root"
          "d ${dataDir}/config 0750 root root"
        ];

        networking.firewall.interfaces."${networkConfig.tailscale.name}".allowedTCPPorts = [
          6052
          6055
        ];
      };
  };
}
