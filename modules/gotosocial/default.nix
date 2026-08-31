{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    disko.url = "github:nix-community/disko";
  };

  den.aspects.gotosocial = {
    nixos =
      { config, ... }:
      {
        imports = [
          inputs.agenix.nixosModules.default
          inputs.disko.nixosModules.disko
        ];

        age.secrets = {
          gotosocial-environment = {
            file = ../../agenix/gotosocial/environment.age;
          };
        };

        disko.devices.zpool.zroot.datasets = {
          "root/services/gotosocial" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/gotosocial";
              compression = "zstd";
              recordsize = "512k";
              atime = "off";
            };
            mountpoint = "/var/lib/gotosocial";
          };
        };

        services.gotosocial = {
          enable = true;
          setupPostgresqlDB = true;

          environmentFile = config.age.secrets.gotosocial-environment.path;

          settings = {
            host = "networked.systems";
            bind-address = "127.0.0.1";
            port = 8080;
            application-name = "networked.systems GoToSocial";

            protocol = "https";

            storage-local-base-path = "/var/lib/gotosocial/storage";

            media-emoji-local-max-size = "200KiB";
            media-emoji-remote-max-size = "200KiB";
            media-remote-cache-duration = "3 days";

            instance-languages = [
              "en"
              "de"
            ];
            accounts-registration-open = false;
            landing-page-user = "daniel";
          };
        };
      };
  };
}
