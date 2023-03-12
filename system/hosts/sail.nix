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

    (import ../nixos/libreddit.nix (args // { inherit secret; }))

    (import ../nixos/mastodon.nix (args // { inherit secret; }))

    (import ../nixos/nitter.nix (args // { inherit secret; }))

    (import ../nixos/ntfy-sh.nix (args // { inherit secret; }))

    ../nixos/rimgo.nix

    ../nixos/synapse.nix

    ../nixos/websites-sail.nix

    (import ../nixos/tailscale.nix (args // { inherit secret; }))

    (import ../nixos/arion.nix (args // { inherit secret; }))
    ../../container/webserver
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

    interfaces = {
      enp1s0.ipv6.addresses = secret.networking.interfaces.enp1s0.ipv6.addresses;

      enp7s0.ipv4 = {
        addresses = [{ address = "10.99.99.2"; prefixLength = 32; }];

        routes = [
          { address = "10.99.99.1"; prefixLength = 32; }
          { address = "10.99.99.0"; prefixLength = 24; via = "10.99.99.1"; }
        ];
      };
    };

    defaultGateway6 = { address = "fe80::1"; interface = "enp1s0"; };

    dhcpcd.denyInterfaces = [ "enp7s0" "veth*" ];

    timeServers = [
      "ntp1.hetzner.de"
      "ntp2.hetzner.com"
      "ntp3.hetzner.net"
      "time.cloudflare.com"
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
