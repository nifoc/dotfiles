let
  homeDir = "/Users/daniel";
in
{
  imports = [
    ../../agenix/hosts/Pallas/config.nix
    ../shared/show-update-changelog.nix

    ../darwin/sudo.nix

    ../darwin/zsh.nix
    ../darwin/attic.nix

    ../darwin/fake-homebrew.nix
  ];

  system.stateVersion = 5;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      extra-platforms = [ "x86_64-darwin" ];

      log-lines = 25;
      keep-derivations = true;
      keep-outputs = true;

      builders-use-substitutes = true;

      substituters = [
        "https://nix-cache.kempkens.network/nifoc-systems?priority=30"
        "https://nix-cache.kempkens.network/nifoc-ci?priority=35"
        "https://nix-community.cachix.org?priority=50"
        "https://cache.garnix.io?priority=60"
        "https://cache.lix.systems?priority=70"
      ];

      trusted-public-keys = [
        "nifoc-systems:jLf2XYhCdf7/VAT7c2sIgaqm/1+NCXwapE2qs5fGrEw="
        "nifoc-ci:YGmPyqh3kbF7eQhMX9esbQpdYU4f3Q+WEx+sv97KKHo="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
      ];

      trusted-users = [ "@admin" ];

      connect-timeout = 5;
      netrc-file = "/etc/nix/netrc";
      sandbox = "relaxed";
    };

    optimise = {
      automatic = true;
    };

    distributedBuilds = true;

    buildMachines = [
      {
        hostName = "boron.ts.kempkens.network";
        protocol = "ssh-ng";
        systems = [ "x86_64-linux" ];
        mandatoryFeatures = [ ];
        supportedFeatures = [
          "benchmark"
          "big-parallel"
        ];
        sshUser = "nix-remote-builder";
        sshKey = "/etc/nix/id_nix_remote_builder";
        maxJobs = 2;
        speedFactor = 1;
      }

      {
        hostName = "carbon.ts.kempkens.network";
        protocol = "ssh-ng";
        systems = [ "aarch64-linux" ];
        mandatoryFeatures = [ ];
        supportedFeatures = [
          "benchmark"
          "big-parallel"
        ];
        sshUser = "nix-remote-builder";
        sshKey = "/etc/nix/id_nix_remote_builder";
        maxJobs = 2;
        speedFactor = 1;
      }
    ];

    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 3;
        Minute = 15;
      };
    };
  };

  environment.etc."ssh/ssh_config.d/100-nix-remote-builder.conf".text = ''
    Host carbon.ts.kempkens.network
      User nix-remote-builder
      Port 22
      IdentityFile /etc/nix/id_nix_remote_builder
      StrictHostKeyChecking accept-new

    Host boron.ts.kempkens.network
      User nix-remote-builder
      Port 22
      IdentityFile /etc/nix/id_nix_remote_builder
      StrictHostKeyChecking accept-new
  '';

  documentation.doc.enable = false;

  users = {
    users.daniel = {
      home = homeDir;
    };
  };

  environment = {
    darwinConfig = "${homeDir}/.config/nixpkgs/system/hosts/Pallas.nix";
  };

  services = {
    nix-daemon = {
      logFile = "/var/log/nix-daemon.log";
    };
  };
}
