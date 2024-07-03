{ pkgs, ... }:

let
  secret = import ../../secret/hosts/adsb-antenna.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/adsb-antenna.nix
    ../shared/show-update-changelog.nix
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
        "https://attic.cache.daniel.sx/nifoc-systems?priority=1"
        "https://attic.cache.daniel.sx/nifoc-ci?priority=2"
        "https://nix-community.cachix.org?priority=3"
        "https://cache.garnix.io?priority=4"
      ];

      trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nifoc-ci:JpD9zqVQi8JuS7B8htPDOQZh08rhInMnGFS9RVhiuwk="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-derivations = true
      keep-outputs = true
    '';
  };

  environment.etc."nix/netrc".source = ../../secret/shared/nix-netrc;

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };

    tmp.cleanOnBoot = true;
  };

  networking = {
    hostName = "adsb-antenna";

    dhcpcd.denyInterfaces = [ "veth*" ];

    timeServers = [
      "ptbtime1.ptb.de"
      "ptbtime2.ptb.de"
      "ptbtime3.ptb.de"
    ];
  };

  services.journald.extraConfig = ''
    SystemMaxUse=512M
    MaxRetentionSec=7day
  '';

  security.sudo.enable = true;

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
      inherit (secret.users.daniel) hashedPassword;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };
  };
}
