{
  pkgs,
  lib,
  config,
  ...
}:

let
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/xenon.nix
    ../nixos/zfs.nix
    ../../agenix/hosts/xenon/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/sudo.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix
    ../nixos/msmtp.nix
    ../nixos/debugging-tools.nix

    ../nixos/git.nix

    ../nixos/caddy

    ../nixos/attic.nix

    #../nixos/restic/xenon.nix

    ../nixos/smartd.nix

    ../nixos/tailscale-router.nix
    ../nixos/tailscale-exit-node.nix
    ../nixos/tailscale-nodns.nix
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

  zramSwap = {
    enable = true;
    #writebackDevice = "/dev/zvol/dozer/swap-writeback";
  };

  networking = {
    hostName = "xenon";
    hostId = "b09ca5ca";
    useNetworkd = true;
  };

  systemd = {
    enableEmergencyMode = false;

    settings.Manager = {
      RuntimeWatchdogSec = 20;
      RebootWatchdogSec = 30;
    };

    network = rec {
      enable = true;

      networks = {
        "10-lan" = {
          matchConfig.Name = "eth0";
          networkConfig = {
            DHCP = "yes";
            IPv6AcceptRA = true;
            IPv6PrivacyExtensions = true;
          };
          linkConfig.RequiredForOnline = "routable";

          ntp = [
            "10.0.0.5"
            "10.0.0.7"
          ];
        };
      };

      wait-online.extraArgs = [
        "--interface=${networks."10-lan".matchConfig.Name}"
      ];
    };

    sleep.settings.Sleep = {
      AllowSuspend = "no";
      AllowHibernation = "no";
    };
  };

  services = {
    udev.extraRules = ''
      ATTR{address}=="78:55:36:07:b3:8f", NAME="eth0"
    '';

    journald.extraConfig = ''
      SystemMaxUse=4G
      MaxRetentionSec=30day
    '';
  };

  services.zfs =
    let
      inherit (lib) mkForce;
    in
    {
      autoSnapshot = {
        daily = mkForce 7;
      };

      autoScrub = {
        interval = mkForce "quarterly";
        pools = [ "tank" ];
      };
    };

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  fonts.fontconfig.enable = false;

  programs = {
    htop.enable = true;
    zsh.enable = true;
  };

  users = {
    groups = {
      daniel.gid = 1001;
    };

    users = {
      root = {
        openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
      };

      daniel = {
        uid = 1001;
        hashedPasswordFile = config.age.secrets.user-daniel-password.path;
        isNormalUser = true;
        home = "/home/daniel";
        description = "Daniel";
        extraGroups = [
          "daniel"
          "wheel"
        ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
          ssh-keys.LAN
          ssh-keys.DanielsPhone
        ];
      };
    };
  };
}
