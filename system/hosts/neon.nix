args@{ pkgs, config, ... }:

let
  secret = import ../../secret/hosts/neon.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/neon.nix
    ../../agenix/hosts/neon/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/raspberry.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix

    ../nixos/git.nix

    ../nixos/attic.nix

    ../nixos/chrony.nix

    (import ../nixos/forgejo-runner.nix (args // { inherit secret; name = "neon"; tag = "ubuntu-latest-arm64"; nixTag = "arm64"; }))

    ../nixos/mosquitto.nix

    ../nixos/rtl_433.nix

    ../nixos/tailscale-router.nix

    ../nixos/container.nix
  ];

  system.stateVersion = "23.11";

  nix = {
    package = pkgs.nixVersions.stable;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];

      log-lines = 25;
      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      extra-substituters = [
        "https://attic.cache.daniel.sx/nifoc-systems?priority=30"
        "https://attic.cache.daniel.sx/nifoc-ci?priority=35"
        "https://nix-community.cachix.org?priority=50"
        "https://cache.garnix.io?priority=60"
      ];

      extra-trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nifoc-ci:JpD9zqVQi8JuS7B8htPDOQZh08rhInMnGFS9RVhiuwk="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];

      connect-timeout = 5;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  environment.etc."nix/netrc".source = ../../secret/shared/nix-netrc;

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };

    tmp.cleanOnBoot = true;
  };

  networking = {
    hostName = "neon";
    useNetworkd = true;
  };

  systemd.network = {
    enable = true;

    netdevs = {
      "20-vlan10" = {
        netdevConfig = {
          Kind = "vlan";
          Name = "vlan51";
        };
        vlanConfig.Id = 51;
      };
    };

    networks = {
      "10-lan" = {
        matchConfig.Name = "end0";
        vlan = [ "vlan51" ];
        networkConfig = {
          DHCP = "yes";
          IPv6AcceptRA = true;
          IPv6PrivacyExtensions = true;
        };
        linkConfig.RequiredForOnline = "routable";

        ntp = [
          "ptbtime1.ptb.de"
          "ptbtime2.ptb.de"
          "ptbtime3.ptb.de"
        ];
      };

      "20-iot" = {
        matchConfig.Name = "vlan51";
        networkConfig = {
          DHCP = "no";
          IPv6AcceptRA = false;
        };
        address = [ "10.0.51.7/24" ];
        linkConfig.RequiredForOnline = "routable";
      };
    };

    wait-online.extraArgs = [
      "--interface=end0"
    ];
  };

  services.journald.extraConfig = ''
    SystemMaxUse=512M
    MaxRetentionSec=30day
  '';

  security.sudo.enable = true;

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  services.hardware.argonone.enable = true;

  programs = {
    fish.enable = true;
    zsh.enable = true;
    htop.enable = true;
  };

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };

    daniel = {
      hashedPasswordFile = config.age.secrets.user-daniel-password.path;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };
  };
}
