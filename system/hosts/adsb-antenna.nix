args@{ pkgs, lib, ... }:

let
  inherit (lib) optionals;

  secret = import ../../secret/hosts/adsb-antenna.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/adsb-antenna.nix
    ../nixos/raspberry.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    ../nixos/arion.nix
    ../../container/adsb
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
      keep-derivations = true
      keep-outputs = true
    '';
  };

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };

    cleanTmpDir = true;
  };

  networking = {
    hostName = "adsb-antenna";

    dhcpcd.denyInterfaces = [ "veth*" ];

    timeServers = [
      "ntp1.hetzner.de"
      "ntp2.hetzner.com"
      "ntp3.hetzner.net"
      "time.cloudflare.com"
    ];
  };

  services.journald.extraConfig = ''
    SystemMaxUse=512M
  '';

  documentation.doc.enable = false;

  programs.fish.enable = true;

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };

    daniel = {
      hashedPassword = secret.users.daniel.hashedPassword;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };
  };
}
