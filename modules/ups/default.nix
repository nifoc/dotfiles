{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.ups = {
    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        upsConfig = cfg.ups.primary;
        networkConfig = cfg.networking;
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          ups-primary-password = {
            file = ../../agenix/ups/${config.networking.hostName}/primary-password.age;
          };
        };

        power.ups = {
          enable = true;
          mode = "standalone";
          openFirewall = true;

          ups.primary = {
            inherit (upsConfig) description;
            driver = "usbhid-ups";
            port = "auto";
          };

          users.upsmon = {
            passwordFile = config.age.secrets.ups-primary-password.path;
            upsmon = "primary";
          };

          upsd.listen = [
            { address = "127.0.0.1"; }
            { address = networkConfig.default.ipv4; }
          ];

          upsmon.monitor.primary.user = "upsmon";
        };
      };
  };
}
