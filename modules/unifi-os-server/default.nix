{ den, inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
    unifi-os-server.url = "github:rcambrj/unifi-os-server";
  };

  den.aspects.unifi-os-server = {
    includes = with den.aspects; [
      podman
    ];

    nixos =
      { config, ... }:
      let
        stateDir = "/var/lib/unifi-os-server";

        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;
        unifiCfg = config.services.unifi-os-server;
      in
      {
        imports = [
          inputs.disko.nixosModules.disko
          inputs.unifi-os-server.nixosModules.unifi-os-server
        ];

        disko.devices.zpool.zroot.datasets = {
          "root/services/unifi-os-server" = {
            type = "zfs_fs";
            options = {
              mountpoint = stateDir;
              atime = "off";
            };
            mountpoint = stateDir;
          };
        };

        services.unifi-os-server = {
          enable = true;
          inherit stateDir;
          uosSystemIP = "10.0.100.5";
          openFirewallUiPort = false;
          openFirewallServicePorts = false;
        };

        networking.firewall.interfaces."${networkConfig.tailscale.name}" = {
          allowedTCPPorts = [ unifiCfg.ports.ui ] ++ unifiCfg.serviceTCPPorts;
          allowedUDPPorts = unifiCfg.serviceUDPPorts;
        };
      };
  };
}
