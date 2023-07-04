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
    ../nixos/msmtp.nix
    ../nixos/smartd.nix

    ../nixos/git.nix

    ../nixos/acme-tanker.nix
    ../nixos/nginx.nix
    ../nixos/postgresql.nix
    ../nixos/elasticsearch.nix
    ../nixos/mosquitto.nix
    ../nixos/container.nix

    ../nixos/anonymous-overflow.nix

    ../nixos/atuin-sync.nix

    (import ../nixos/atticd.nix (args // { inherit secret; }))

    ../nixos/fedifetcher.nix

    (import ../nixos/home-proxy.nix (args // { inherit secret; }))

    ../nixos/invidious.nix

    (import ../nixos/libreddit.nix (args // { inherit secret; }))

    ../nixos/linkding.nix

    ../nixos/mastodon.nix

    ../nixos/miniflux.nix

    (import ../nixos/nitter.nix (args // { inherit secret; }))

    (import ../nixos/ntfy-sh.nix (args // { inherit secret; }))

    ../nixos/rimgo.nix

    ../nixos/synapse.nix

    ../nixos/tailscale.nix

    ../nixos/websites-tanker.nix

    ../nixos/wefwef.nix

    ../../container/matrix
    ../../container/proxitok
    ../../container/weewx
  ];

  system.stateVersion = "22.11";

  nix = {
    package = pkgs.nixVersions.stable;

    settings = {
      auto-optimise-store = true;

      substituters = [
        "https://attic.cache.daniel.sx/nifoc-systems"
        "https://nifoc.cachix.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nifoc.cachix.org-1:ymuftq7RgN/lf/iWXFK8gpwDSAGFaGBeliWe9u6q8II="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
      extra-platforms = aarch64-linux
      keep-derivations = true
      keep-outputs = true
    '';
  };

  environment.etc."nix/netrc".source = ../../secret/shared/nix-netrc;

  boot = {
    tmp.cleanOnBoot = true;

    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  networking = {
    hostName = "tanker";
    hostId = "d89f488a";
    useNetworkd = true;

    extraHosts = ''
      127.0.0.1 attic.cache.daniel.sx
    '';
  };

  systemd.network = {
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

  services.journald.extraConfig = ''
    SystemMaxUse=4G
  '';

  services.zfs.autoScrub.enable = true;

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  programs.fish.enable = true;
  programs.htop.enable = true;

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ssh-keys.BackupTanker ];
    };

    daniel = {
      passwordFile = config.age.secrets.user-daniel-password.path;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ];
    };
  };
}