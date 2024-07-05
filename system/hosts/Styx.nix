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

    ../darwin/mas.nix
  ];

  nix = {
    package = pkgs.nixVersions.stable;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      extra-platforms = [ "x86_64-darwin" ];

      log-lines = 25;
      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      builders-use-substitutes = true;

      extra-substituters = [
        "https://attic.cache.daniel.sx/nifoc-systems?priority=30"
        "https://nix-community.cachix.org?priority=50"
        "https://cache.garnix.io?priority=60"
      ];

      extra-trusted-substituters = [
        "https://attic.hosting.nedeco.mobi/devshells"
      ];

      extra-trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="

        # extra-trusted-substituters
        "devshells:YXtbU0DheB229oCr2D0H0qHjj2Ed/e2VZiLSXgQ1IVA="
      ];

      trusted-users = [ "@admin" ];

      connect-timeout = 5;
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
