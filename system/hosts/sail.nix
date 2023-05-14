args@{ pkgs, ... }:

let
  secret = import ../../secret/hosts/sail.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/sail.nix
    ../../agenix/hosts/sail/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    ../nixos/acme-sail.nix
    ../nixos/nginx.nix

    ../nixos/atuin-sync.nix

    ../nixos/attic.nix

    ../nixos/anonymous-overflow.nix

    (import ../nixos/freshrss.nix (args // { inherit secret; }))

    ../nixos/invidious.nix

    (import ../nixos/libreddit.nix (args // { inherit secret; }))

    (import ../nixos/mastodon.nix (args // { inherit secret; }))

    (import ../nixos/nitter.nix (args // { inherit secret; }))

    (import ../nixos/ntfy-sh.nix (args // { inherit secret; }))

    ../nixos/rimgo.nix

    ../nixos/synapse.nix

    ../nixos/websites-sail.nix

    ../nixos/tailscale.nix

    ../nixos/mosquitto.nix

    ../nixos/container.nix
    ../../container/weewx
    ../../container/matrix
    ../../container/proxitok
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
      post-build-hook = ${../../home/programs/scripts/attic-system-cache}
    '';
  };

  environment.etc."nix/netrc".source = ../../secret/shared/nix-netrc;

  boot = {
    tmp.cleanOnBoot = true;

    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  zramSwap.enable = true;

  networking = {
    hostName = "sail";
    useNetworkd = true;

    extraHosts = ''
      10.99.99.4 attic.cache.daniel.sx
    '';
  };

  systemd.network = {
    enable = true;

    networks = {
      "10-wan" = {
        matchConfig.Name = "enp1s0";
        networkConfig = {
          DHCP = "ipv4";
          Address = "2a01:4f8:c2c:989c::1/64";
          Gateway = "fe80::1";
        };
        linkConfig.RequiredForOnline = "routable";

        ntp = [
          "ntp1.hetzner.de"
          "ntp2.hetzner.com"
          "ntp3.hetzner.net"
        ];
      };

      "20-private" = {
        matchConfig.Name = "enp7s0";
        networkConfig = {
          DHCP = "ipv4";
          IPv6AcceptRA = false;
        };
        linkConfig.RequiredForOnline = "yes";
      };
    };

    wait-online.ignoredInterfaces = [
      "veth0"
      "veth1"
      "veth2"
      "veth3"
      "veth4"
      "veth5"
    ];
  };

  services.journald.extraConfig = ''
    SystemMaxUse=1G
  '';

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  programs.fish.enable = true;

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ];
    };

    daniel = {
      inherit (secret.users.daniel) hashedPassword;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ];
    };
  };
}
