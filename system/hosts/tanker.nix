args@{ pkgs, config, ... }:

let
  secret = import ../../secret/hosts/tanker.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/tanker.nix
    ../nixos/zfs.nix
    ../../agenix/hosts/tanker/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix
    ../nixos/msmtp.nix
    ../nixos/smartd.nix

    ../nixos/git.nix

    ../nixos/acme-tanker.nix
    ../nixos/nginx.nix
    ../nixos/nginx-tanker.nix
    ../nixos/postgresql.nix
    ../nixos/elasticsearch.nix
    ../nixos/mosquitto.nix
    ../nixos/container.nix

    ../nixos/anonymous-overflow.nix

    ../nixos/atticd.nix

    ../nixos/fedifetcher.nix

    ../nixos/forgejo.nix
    (import ../nixos/forgejo-runner.nix (args // { name = "tanker"; tag = "ubuntu-latest-amd64"; nixTag = "amd64"; }))

    (import ../nixos/home-proxy.nix (args // { inherit secret; }))

    ../nixos/invidious.nix

    (import ../nixos/redlib.nix (args // { inherit secret; }))

    ../nixos/mastodon.nix

    ../nixos/miniflux.nix

    (import ../nixos/ntfy-sh.nix (args // { inherit secret; }))

    ../nixos/matrix

    ../nixos/tailscale.nix
    ../nixos/tailscale-nodns.nix

    ../nixos/weewx.nix
  ];

  system.stateVersion = "22.11";

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      extra-platforms = [ "aarch64-linux" ];

      log-lines = 25;
      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      extra-substituters = [
        "https://attic.cache.daniel.sx/nifoc-systems?priority=30"
        "https://attic.cache.daniel.sx/nifoc-ci?priority=35"
        "https://nix-community.cachix.org?priority=50"
        "https://cache.garnix.io?priority=60"
        "https://cache.lix.systems?priority=70"
      ];

      extra-trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nifoc-ci:JpD9zqVQi8JuS7B8htPDOQZh08rhInMnGFS9RVhiuwk="
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

    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  networking = {
    hostName = "tanker";
    hostId = "d89f488a";
    useNetworkd = true;
  };

  systemd = {
    enableEmergencyMode = false;

    watchdog = {
      runtimeTime = "20s";
      rebootTime = "30s";
    };

    network = {
      enable = true;

      networks = {
        "10-wan" = {
          matchConfig.Name = "enp41s0";
          address = [
            "94.130.142.168/26"
            "2a01:4f8:13b:2d81::2/64"
          ];
          gateway = [
            "94.130.142.129"
            "fe80::1"
          ];
          linkConfig.RequiredForOnline = "routable";

          dns = [
            "185.12.64.1"
            "185.12.64.2"
            "2a01:4ff:ff00::add:1"
            "2a01:4ff:ff00::add:2"
          ];

          ntp = [
            "ntp1.hetzner.de"
            "ntp2.hetzner.com"
            "ntp3.hetzner.net"
          ];
        };
      };

      wait-online.extraArgs = [
        "--interface=enp41s0"
      ];
    };

    sleep.extraConfig = ''
      AllowSuspend=no
      AllowHibernation=no
    '';
  };

  services.journald.extraConfig = ''
    SystemMaxUse=4G
    MaxRetentionSec=30day
  '';

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
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ssh-keys.BackupTanker ];
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
