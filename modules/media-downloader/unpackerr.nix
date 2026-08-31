{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.media-downloader = {
    nixos =
      { pkgs, config, ... }:
      let
        requiredPaths = [ "/dozer/downloads" ];
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          unpackerr-config = {
            file = ../../agenix/unpackerr/config.age;
            owner = "media_user";
            group = "user_media";
          };
        };

        systemd = {
          services.unpackerr = {
            description = "unpackerr service";
            after = [ "network-online.target" ];
            wants = [ "network-online.target" ];
            wantedBy = [ ];

            unitConfig = {
              ConditionDirectoryNotEmpty = requiredPaths;
            };

            serviceConfig = {
              Type = "simple";
              User = "media_user";
              Group = "user_media";
              ExecStart = "${pkgs.unpackerr}/bin/unpackerr --config ${config.age.secrets.unpackerr-config.path}";
            };
          };

          paths.unpackerr = {
            wantedBy = [ "multi-user.target" ];

            pathConfig = {
              DirectoryNotEmpty = requiredPaths;
            };
          };
        };
      };
  };
}
