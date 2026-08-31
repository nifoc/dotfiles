{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    nixos-unstable-small.url = "https://channels.nixos.org/nixos-unstable-small/nixexprs.tar.xz";
    niks3.url = "github:Mic92/niks3";
  };

  den.aspects.base =
    let
      lixOverlay =
        final: prev:
        let
          nix = final.lixPackageSets.latest.lix;
        in
        {
          nix-forecast = prev.nix-forecast.override { inherit nix; };
        };

      veryUnstableOverlay = final: _prev: {
        veryUnstable = import inputs.nixos-unstable-small {
          system = final.system;
        };
      };
    in
    {
      nixos =
        { pkgs, config, ... }:
        {
          imports = [
            inputs.agenix.nixosModules.default
            inputs.niks3.nixosModules.niks3-auto-upload
          ];

          age.secrets = {
            nix-netrc = {
              file = ../../agenix/base/nix/netrc.age;
              path = "/etc/nix/netrc";
              mode = "440";
              symlink = false;
            };

            niks3-auto-upload-api-token = {
              file = ../../agenix/nix-cache/niks3-api-token.age;
            };
          };

          nixpkgs = {
            overlays = [
              lixOverlay
              veryUnstableOverlay
            ];
          };

          nix = {
            package = pkgs.lixPackageSets.latest.lix;

            channel.enable = false;
            nixPath = [ "nixpkgs=${pkgs.path}" ];

            settings = {
              experimental-features = [
                "nix-command"
                "flakes"
                "flake-self-attrs"
              ];

              log-lines = 50;
              auto-optimise-store = true;
              keep-derivations = true;
              keep-outputs = true;
              fallback = true;

              extra-substituters = [
                "https://niks3-cache.kempkens.network?priority=45"
                "https://nix-community.cachix.org?priority=50"
              ];

              extra-trusted-public-keys = [
                "niks3-cache.kempkens.network-1:Kd/KbllMOeedxyUP4pWcxlHJqLC1un/iFaBcEJ6E424="
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              ];

              connect-timeout = 5;
              min-free = 128000000;
              max-free = 1000000000;
              warn-dirty = false;
              tarball-ttl = 60 * 60 * 24;
            };

            gc = {
              automatic = true;
              dates = "weekly";
              options = "--delete-older-than 14d";
            };
          };

          services.niks3-auto-upload = {
            enable = true;
            serverUrl = "https://niks3-cache.kempkens.network";
            authTokenFile = config.age.secrets.niks3-auto-upload-api-token.path;
          };
        };

      darwin =
        {
          pkgs,
          config,
          lib,
          inputs',
          ...
        }:
        let
          # Workaround since socket path isn't overridden
          niksHookPackage = inputs'.niks3.packages.niks3-hook;
          niksPostBuildHookScript = pkgs.writeShellScript "niks3-post-build-hook" ''
            exec ${lib.getExe' niksHookPackage "niks3-hook"} send --socket ${config.services.niks3-auto-upload.socketPath} "$@"
          '';
        in
        {
          imports = [
            inputs.agenix.darwinModules.default
            inputs.niks3.darwinModules.niks3-auto-upload
          ];

          age.secrets = {
            nix-netrc = {
              file = ../../agenix/base/nix/netrc.age;
              path = "/etc/nix/netrc";
              mode = "444";
              symlink = false;
            };

            niks3-auto-upload-api-token = {
              file = ../../agenix/nix-cache/niks3-api-token.age;
            };
          };

          nixpkgs = {
            overlays = [
              lixOverlay
              veryUnstableOverlay
            ];
          };

          nix = {
            package = pkgs.lixPackageSets.latest.lix;

            channel.enable = false;
            nixPath = [ "nixpkgs=${pkgs.path}" ];

            settings = {
              experimental-features = [
                "nix-command"
                "flakes"
                "flake-self-attrs"
              ];

              log-lines = 50;
              sandbox = "relaxed";
              keep-derivations = true;
              keep-outputs = true;
              fallback = true;

              extra-substituters = [
                "https://niks3-cache.kempkens.network?priority=45"
                "https://nix-community.cachix.org?priority=50"
              ];

              extra-trusted-public-keys = [
                "niks3-cache.kempkens.network-1:Kd/KbllMOeedxyUP4pWcxlHJqLC1un/iFaBcEJ6E424="
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              ];

              trusted-users = [ "@admin" ];

              connect-timeout = 5;
              min-free = 128000000;
              max-free = 1000000000;
              warn-dirty = false;
              tarball-ttl = 60 * 60 * 24;
              netrc-file = "/etc/nix/netrc";

              post-build-hook = lib.mkForce (toString niksPostBuildHookScript);
            };

            # optimise and/or gc cause issues with syspolicyd
            # See: https://github.com/nix-darwin/nix-darwin/issues/1307
            optimise.automatic = false;

            gc = {
              automatic = false;
              interval = {
                Weekday = 0;
                Hour = 3;
                Minute = 15;
              };
            };
          };

          services = {
            nix-daemon = {
              logFile = "/var/log/nix-daemon.log";
            };

            niks3-auto-upload = {
              enable = true;
              serverUrl = "https://niks3-cache.kempkens.network";
              authTokenFile = config.age.secrets.niks3-auto-upload-api-token.path;
            };
          };
        };
    };
}
