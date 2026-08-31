{
  inputs,
  den,
  lib,
  ...
}:
{
  flake-file.inputs = {
    self.submodules = true;

    den.url = "github:denful/den";

    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-file.url = "github:denful/flake-file";
    import-tree.url = "github:denful/import-tree";
  };

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.flake-file.flakeModules.nix-auto-follow or { })
    (inputs.den.flakeModules.dendritic or { })
  ];

  flake-file = {
    outputs = ''
      inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree [ ./modules ./private/modules ])
    '';

    write-hooks = [
      {
        index = 10;
        program =
          pkgs:
          pkgs.writeShellApplication {
            name = "flake-file-hook-flake-update";
            text = "${lib.meta.getExe pkgs.lixPackageSets.latest.lix} flake update";
          };
      }
    ];
  };

  den = {
    default.includes = [ den._.inputs' ];

    schema = {
      hm-host.includes = [
        {
          nixos.home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
          };

          darwin.home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];

      user = {
        includes = [ den._.mutual-provider ];
        classes = lib.mkDefault [ "homeManager" ];
      };
    };
  };
}
