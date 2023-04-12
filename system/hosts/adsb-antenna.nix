args@{ pkgs, lib, ... }:

let
  secret = import ../../secret/hosts/adsb-antenna.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/adsb-antenna.nix
    ../nixos/raspberry.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    ../nixos/attic.nix

    ../nixos/container.nix
    ../../container/adsb
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
        "https://wurzelpfropf.cachix.org"
      ];

      trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nifoc.cachix.org-1:ymuftq7RgN/lf/iWXFK8gpwDSAGFaGBeliWe9u6q8II="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "wurzelpfropf.cachix.org-1:ilZwK5a6wJqVr7Fyrzp4blIEkGK+LJT0QrpWr1qBNq0="
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
      post-build-hook = ${../../home/programs/scripts/attic-system-cache}
    '';
  };

  environment.etc."nix/netrc".source = ../../secret/shared/nix-netrc;

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

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

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
