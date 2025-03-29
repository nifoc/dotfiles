args@{ pkgs, config, ... }:

let
  secret = import ../../secret/hosts/mediaserver.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/mediaserver.nix
    ../../agenix/hosts/mediaserver/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix

    ../nixos/git.nix

    ../nixos/acme-mediaserver.nix
    ../nixos/nginx.nix
    ../nixos/nginx-mediaserver.nix
    ../nixos/postgresql.nix

    ../nixos/attic.nix

    (import ../nixos/controld.nix (args // { podmanDNS = true; }))

    ../nixos/ddg.nix

    ../nixos/tailscale-router.nix
    ../nixos/tailscale-nodns.nix

    ../nixos/unbound.nix

    ../nixos/container.nix
    ../nixos/mediaserver-setup.nix
    (import ../nixos/wireguard-netns.nix (args // { inherit secret; }))
    (import ../nixos/wireguard-firewall-mediaserver.nix (args // { inherit secret; }))
    ../nixos/prowlarr.nix
    ../nixos/autobrr.nix
    ../nixos/unpackerr.nix
    ../nixos/sonarr.nix
    ../nixos/radarr.nix
    ../nixos/recyclarr.nix
    ../nixos/sabnzbd.nix
    ../nixos/qbittorrent.nix
    ../nixos/flaresolverr.nix
    ../nixos/jellyfin.nix
    ../nixos/aria2.nix

    ../nixos/convos.nix

    ../../container/tubearchivist
    ../../secret/container/additional-media
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

  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };

  networking = {
    hostName = "mediaserver";
    useNetworkd = true;
  };

  systemd.network = {
    enable = true;

    networks = {
      "10-lan" = {
        matchConfig.Name = "ens3";
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
    };

    wait-online.extraArgs = [
      "--interface=ens3"
    ];
  };

  services.journald.extraConfig = ''
    SystemMaxUse=1G
    MaxRetentionSec=30day
  '';

  security.sudo.enable = true;

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  fonts.fontconfig.enable = false;

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
