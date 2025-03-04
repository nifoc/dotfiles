{ pkgs, config, ... }:

let
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/carbon.nix
    ../nixos/zfs.nix
    ../../agenix/hosts/carbon/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix

    ../nixos/git.nix

    ../nixos/acme-carbon.nix
    ../nixos/nginx.nix
    ../nixos/nginx-carbon.nix
    ../nixos/postgresql.nix

    ../nixos/atuin-sync.nix

    ../nixos/fedifetcher.nix

    ../nixos/gotosocial.nix

    ../nixos/tailscale.nix
    ../nixos/tailscale-nodns.nix

    ../nixos/websites-carbon.nix
  ];

  system.stateVersion = "22.11";

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];

      log-lines = 25;
      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      extra-substituters = [
        "https://nix-community.cachix.org?priority=50"
        "https://cache.garnix.io?priority=60"
        "https://cache.lix.systems?priority=70"
      ];

      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
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

  security.sudo.enable = true;

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
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ssh-keys.DanielsPhone ];
    };
  };
}

