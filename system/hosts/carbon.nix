args@{ pkgs, config, ... }:

let
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/carbon.nix
    ../nixos/zfs.nix
    ../../agenix/hosts/carbon/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/sudo.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix
    ../nixos/msmtp.nix

    ../nixos/git.nix

    ../nixos/caddy
    ../nixos/postgresql.nix

    ../nixos/attic.nix

    ../nixos/atuin-sync.nix

    ../nixos/matrix

    ../nixos/fail2ban.nix

    ../nixos/fedifetcher.nix

    ../nixos/forgejo.nix
    (import ../nixos/forgejo-runner.nix (
      args
      // {
        name = "carbon";
        tag = "ubuntu-latest-arm64";
        nixTag = "arm64";
      }
    ))

    ../nixos/geoipupdate.nix

    ../nixos/gotosocial.nix

    ../nixos/monitoring/prometheus_exporters.nix

    ../nixos/restic/carbon.nix

    ../nixos/tailscale.nix
    ../nixos/tailscale-nodns.nix

    ../nixos/vaultwarden.nix

    ../nixos/websites-carbon.nix

    ../nixos/container.nix
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

      extra-trusted-users = [ "nix-remote-builder" ];

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

  zramSwap.enable = true;

  networking = {
    hostName = "carbon";
    hostId = "793c1e05";
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
        "10-wan" = {
          matchConfig.Name = "eth0";
          networkConfig = {
            DHCP = "ipv4";
            Address = "2a01:4f8:1c1b:9a20::2/64";
            Gateway = "fe80::1";
          };
          linkConfig.RequiredForOnline = "routable";

          ntp = [
            "ntp1.hetzner.de"
            "ntp2.hetzner.com"
            "ntp3.hetzner.net"
          ];
        };
      };

      wait-online.extraArgs = [
        "--interface=${networks."10-wan".matchConfig.Name}"
      ];
    };

    sleep.extraConfig = ''
      AllowSuspend=no
      AllowHibernation=no
    '';
  };

  services = {
    udev.extraRules = ''
      ATTR{address}=="96:00:04:1c:21:32", NAME="eth0"
    '';

    journald.extraConfig = ''
      SystemMaxUse=4G
      MaxRetentionSec=30day
    '';
  };

  services.zfs.autoScrub.enable = true;

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  fonts.fontconfig.enable = false;

  programs = {
    htop.enable = true;
    zsh.enable = true;
  };
  environment.systemPackages = [ pkgs.rsync ];

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ];
    };

    daniel = {
      hashedPasswordFile = config.age.secrets.user-daniel-password.path;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        ssh-keys.Hetzner
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
