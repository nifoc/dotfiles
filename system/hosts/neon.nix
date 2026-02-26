args@{ pkgs, config, ... }:

let
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/neon.nix
    ../../agenix/hosts/neon/config.nix
    ../nixos/zfs.nix
    ../shared/show-update-changelog.nix
    ../nixos/raspberry.nix
    ../nixos/sudo.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix
    ../nixos/msmtp.nix

    ../nixos/git.nix

    ../nixos/attic.nix

    ../nixos/caddy

    ../nixos/chrony.nix

    (import ../nixos/blocky.nix (
      args
      // {
        blockyPorts = {
          dns = [
            "10.0.0.7:53"
            "10.0.51.7:53"
            "10.0.200.7:53"
            "100.111.49.64:53"
          ];

          http = [ "127.0.0.1:8053" ];
        };

        valkeyInstance = {
          connect = "10.0.0.100";
          port = 2653;
        };
      }
    ))

    ../nixos/dante.nix

    ../nixos/monitoring/prometheus_exporters.nix

    ../nixos/rtl_433.nix

    ../nixos/smartd.nix

    ../nixos/tailscale-router.nix
    ../nixos/tailscale-nodns.nix

    ../nixos/container.nix
    ../nixos/quadlet.nix
  ];

  system.stateVersion = "23.11";

  nix = {
    package = pkgs.lixPackageSets.latest.lix;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      log-lines = 25;
      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      extra-substituters = [
        "https://nix-cache.kempkens.network/nifoc-systems?priority=30"
        "https://nix-cache.kempkens.network/nifoc-ci?priority=35"
        "https://nix-community.cachix.org?priority=50"
        "https://cache.garnix.io?priority=60"
      ];

      extra-trusted-public-keys = [
        "nifoc-systems:jLf2XYhCdf7/VAT7c2sIgaqm/1+NCXwapE2qs5fGrEw="
        "nifoc-ci:YGmPyqh3kbF7eQhMX9esbQpdYU4f3Q+WEx+sv97KKHo="
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

  boot = {
    tmp.cleanOnBoot = true;
  };

  networking = {
    hostName = "neon";
    hostId = "0105164f";
    useNetworkd = true;
  };

  systemd.network = rec {
    enable = true;

    netdevs = {
      "20-vlan51" = {
        netdevConfig = {
          Kind = "vlan";
          Name = "vlan51";
        };
        vlanConfig.Id = 51;
      };

      "30-vlan200" = {
        netdevConfig = {
          Kind = "vlan";
          Name = "vlan200";
        };
        vlanConfig.Id = 200;
      };
    };

    networks = {
      "10-lan" = {
        matchConfig.Name = "end0";
        vlan = [
          "vlan51"
          "vlan200"
        ];
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

      "30-dtag" = {
        matchConfig.Name = "vlan200";
        networkConfig = {
          DHCP = "no";
          IPv6AcceptRA = false;
        };
        address = [ "10.0.200.7/24" ];
        linkConfig.RequiredForOnline = "routable";
      };
    };

    wait-online.extraArgs = [
      "--interface=${networks."10-lan".matchConfig.Name}"
    ];
  };

  services = {
    udev.extraRules = ''
      ATTR{address}=="d8:3a:dd:e0:d5:50", NAME="end0"
    '';

    journald.extraConfig = ''
      SystemMaxUse=512M
      MaxRetentionSec=21day
    '';
  };

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  programs = {
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
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        ssh-keys.LAN
        ssh-keys.DanielsPhone
      ];
    };
  };
}
