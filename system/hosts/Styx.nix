{ config, ... }:

let
  homeDir = "/Users/daniel";
in
{
  imports = [
    ../../agenix/hosts/Styx/config.nix
    ../shared/show-update-changelog.nix

    ../darwin/defaults.nix
    ../darwin/sudo.nix

    ../darwin/zsh.nix
    ../darwin/attic.nix

    ../darwin/mas.nix
    ../darwin/fake-homebrew.nix
  ];

  system.stateVersion = 5;
  ids.gids.nixbld = 30000;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      extra-platforms = [ "x86_64-darwin" ];

      log-lines = 25;
      keep-derivations = true;
      keep-outputs = true;
      extra-nix-path = "nixpkgs=flake:nixpkgs";

      builders-use-substitutes = true;

      substituters = [
        "https://attic.cache.daniel.sx/nifoc-systems?priority=30"
        "https://nix-community.cachix.org?priority=50"
        "https://cache.garnix.io?priority=60"
        "https://cache.lix.systems?priority=70"
      ];

      trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
      ];

      netrc-file = config.age.secrets.nix-netrc.path;

      trusted-users = [ "@admin" ];

      connect-timeout = 5;
    };

    optimise = {
      automatic = true;
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
