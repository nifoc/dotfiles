args@{ pkgs, config, ... }:

let
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/argon.nix
    ../../agenix/hosts/argon/config.nix
    ../nixos/zfs.nix
    ../shared/show-update-changelog.nix
    ../nixos/raspberry.nix
    ../nixos/sudo.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix
    ../nixos/msmtp.nix

    ../nixos/git.nix

    ../nixos/caddy

    ../nixos/attic.nix

    ../nixos/chrony.nix

    (import ../nixos/blocky.nix (
      args
      // {
        blockyPorts = {
          dns = [
            "10.0.0.5:53"
            "10.0.51.5:53"
            "10.0.200.5:53"
            "100.116.103.122:53"
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

    ../nixos/mosquitto.nix

    ../nixos/restic/argon.nix

    ../nixos/smartd.nix

    ../nixos/tailscale-router.nix
    ../nixos/tailscale-nodns.nix

    ../nixos/weewx.nix
    ../nixos/weewx-proxy.nix
    ../nixos/temper.nix
  ];

  system.stateVersion = "22.11";

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

      trusted-users = [
        "root"
        "nix-remote-builder"
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
    hostName = "argon";
    hostId = "7ecb6d58";
    useNetworkd = true;
  };

  systemd.network = {
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
        address = [ "10.0.51.5/24" ];
        linkConfig.RequiredForOnline = "routable";
      };

      "30-dtag" = {
        matchConfig.Name = "vlan200";
        networkConfig = {
          DHCP = "no";
          IPv6AcceptRA = false;
        };
        address = [ "10.0.200.5/24" ];
        linkConfig.RequiredForOnline = "routable";
      };
    };

    wait-online.extraArgs = [
      "--interface=end0"
    ];
  };

  services = {
    udev.extraRules = ''
      ATTR{address}=="d8:3a:dd:16:36:ac", NAME="end0"
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

  power.ups = {
    enable = true;
    mode = "standalone";
    openFirewall = true;

    ups.primary = {
      description = "Eaton Ellipse PRO 650";
      driver = "usbhid-ups";
      port = "auto";
    };

    users.upsmon = {
      passwordFile = config.age.secrets.ups-primary-password.path;
      upsmon = "primary";
    };

    upsd.listen = [
      { address = "127.0.0.1"; }
      { address = "10.0.0.5"; }
    ];

    upsmon.monitor.primary.user = "upsmon";
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

    nix-remote-builder = {
      isNormalUser = true;
      home = "/home/nix-remote-builder";
      description = "Nix Remote Builder";
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [ ssh-keys.NixRemoteBuilder ];
    };
  };
}
