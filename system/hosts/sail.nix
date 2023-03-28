args@{ pkgs, lib, ... }:

let
  inherit (lib) optionals;

  secret = import ../../secret/hosts/sail.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/sail.nix
    ../../agenix/hosts/sail/config.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    ../nixos/acme-sail.nix
    ../nixos/nginx.nix

    ../nixos/atuin-sync.nix

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

    (import ../nixos/tailscale.nix (args // { inherit secret; }))

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
        "https://nix-community.cachix.org"
        "https://wurzelpfropf.cachix.org"
        "https://nifoc.cachix.org"
      ] ++ optionals secret.nix-cache.nifoc.enabled [
        secret.nix-cache.nifoc.s3Url
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "wurzelpfropf.cachix.org-1:ilZwK5a6wJqVr7Fyrzp4blIEkGK+LJT0QrpWr1qBNq0="
        "nifoc.cachix.org-1:ymuftq7RgN/lf/iWXFK8gpwDSAGFaGBeliWe9u6q8II="
      ] ++ optionals secret.nix-cache.nifoc.enabled [
        secret.nix-cache.nifoc.publicKeyValue
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

  boot = {
    cleanTmpDir = true;

    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  zramSwap.enable = true;

  networking = {
    hostName = "sail";
    useNetworkd = true;
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
