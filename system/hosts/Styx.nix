{ pkgs, ... }:

let
  homeDir = "/Users/daniel";
in
{
  imports = [
    ../../agenix/hosts/Styx/config.nix
    ../shared/show-update-changelog.nix

    ../darwin/defaults.nix
    ../darwin/sudo.nix

    ../darwin/fish.nix
    ../darwin/attic.nix
  ];

  nix = {
    package = pkgs.nixVersions.stable;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      extra-platforms = [ "x86_64-darwin" ];

      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      substituters = [
        "https://attic.cache.daniel.sx/nifoc-systems?priority=1"
        "https://nix-community.cachix.org?priority=2"
      ];

      trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      trusted-users = [ "@admin" ];
    };

    configureBuildUsers = true;

    distributedBuilds = true;

    buildMachines = [
      {
        hostName = "mediaserver.ts.kempkens.network";
        protocol = "ssh-ng";
        systems = [ "x86_64-linux" "aarch64-linux" ];
        sshUser = "nix-remote-builder";
        sshKey = "${homeDir}/.ssh/id_nix_remote_builder";
        maxJobs = 2;
      }

      {
        hostName = "argon.ts.kempkens.network";
        protocol = "ssh-ng";
        systems = [ "aarch64-linux" ];
        sshUser = "nix-remote-builder";
        sshKey = "${homeDir}/.ssh/id_nix_remote_builder";
        maxJobs = 2;
      }
    ];

    gc = {
      automatic = true;
      user = "daniel";
      interval = { Weekday = 0; Hour = 3; Minute = 15; };
    };
  };

  documentation.doc.enable = false;

  users = {
    users.daniel = {
      home = homeDir;
    };
  };

  environment = {
    darwinConfig = "${homeDir}/.config/nixpkgs/system/hosts/Styx.nix";
  };

  services = {
    nix-daemon = {
      enable = true;
      logFile = "/var/log/nix-daemon.log";
    };
  };
}
