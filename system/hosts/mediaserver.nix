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

    ../nixos/git.nix

    ../nixos/acme-mediaserver.nix
    ../nixos/nginx.nix
    ../nixos/nginx-mediaserver.nix
    ../nixos/postgresql.nix

    (import ../nixos/adguardhome.nix (args // { inherit secret; }))

    ../nixos/attic.nix

    ../nixos/bdfr-browser.nix

    ../nixos/tailscale.nix

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
    package = pkgs.nixVersions.stable;

    settings = {
      auto-optimise-store = true;

      substituters = [
        "https://attic.cache.daniel.sx/nifoc-systems"
        "https://attic.cache.daniel.sx/nifoc-ci"
        "https://nifoc.cachix.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nifoc-ci:JpD9zqVQi8JuS7B8htPDOQZh08rhInMnGFS9RVhiuwk="
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

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  fonts.fontconfig.enable = false;
  sound.enable = false;

  programs.fish.enable = true;
  programs.htop.enable = true;

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
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ssh-keys.ShellFish ];
    };
  };
}
