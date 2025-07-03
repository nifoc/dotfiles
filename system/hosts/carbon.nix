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

    ../nixos/acme-carbon.nix
    ../nixos/nginx.nix
    ../nixos/nginx-carbon.nix
    ../nixos/goaccess.nix
    ../nixos/postgresql.nix

    ../nixos/attic.nix

    ../nixos/atuin-sync.nix

    ../nixos/conduwuit.nix
    ../nixos/matrix/mautrix-signal.nix
    ../nixos/matrix/mautrix-whatsapp.nix

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

    ../nixos/gotosocial.nix

    ../nixos/munin/node.nix

    ../nixos/tailscale.nix
    ../nixos/tailscale-nodns.nix
    ../nixos/tailscale-auth.nix

    ../nixos/vaultwarden.nix

    ../nixos/websites-carbon.nix

    ../nixos/container.nix
  ];

  system.stateVersion = "22.11";

  nix = {
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
        "https://cache.lix.systems?priority=70"
      ];

      extra-trusted-public-keys = [
        "nifoc-systems:jLf2XYhCdf7/VAT7c2sIgaqm/1+NCXwapE2qs5fGrEw="
        "nifoc-ci:YGmPyqh3kbF7eQhMX9esbQpdYU4f3Q+WEx+sv97KKHo="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
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

    watchdog = {
      runtimeTime = "20s";
      rebootTime = "30s";
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
