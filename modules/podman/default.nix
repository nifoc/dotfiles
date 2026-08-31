{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.podman = {
    nixos = {
      imports = [ inputs.agenix.nixosModules.default ];

      age.secrets = {
        podman-config = {
          file = ../../agenix/podman/config.age;
          path = "/root/.docker/config.json";
          mode = "400";
        };
      };

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
            flags = [
              "--all"
              "--filter=label!=io.kempkens.keepImage"
            ];
          };
        };

        oci-containers = {
          backend = "podman";
        };
      };

      networking.firewall.interfaces."podman+" = {
        allowedUDPPorts = [
          53
          443
        ];
        allowedTCPPorts = [
          53
          443
          5432
        ];
      };
    };
  };
}
