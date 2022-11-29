args@{ pkgs, lib, ... }:

let
  inherit (lib) optionals;

  secret = import ../../secret/hosts/sail.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/sail.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    (import ../nixos/mastodon.nix (args // { inherit secret; }))

    (import ../nixos/synapse.nix (args // { inherit secret; }))

    (import ../nixos/tailscale.nix (args // { inherit secret; }))

    ../nixos/arion.nix
    ../../container/webserver
    ../../container/matrix
  ];

  nix = {
    package = pkgs.nixVersions.stable;

    settings = {
      auto-optimise-store = true;

      substituters = [
        "https://nix-community.cachix.org"
        "https://nifoc.cachix.org"
      ] ++ optionals secret.nix-cache.nifoc.enabled [
        secret.nix-cache.nifoc.s3Url
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
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

    interfaces.enp1s0.ipv6.addresses = secret.networking.interfaces.enp1s0.ipv6.addresses;
    defaultGateway6 = { address = "fe80::1"; interface = "enp1s0"; };

    dhcpcd.denyInterfaces = [ "veth*" ];

    timeServers = [
      "ntp1.hetzner.de"
      "ntp2.hetzner.com"
      "ntp3.hetzner.net"
      "time.cloudflare.com"
    ];
  };

  documentation.doc.enable = false;

  programs.fish.enable = true;

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ];
    };

    daniel = {
      hashedPassword = secret.users.daniel.hashedPassword;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ];
    };
  };
}
