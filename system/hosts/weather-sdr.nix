args@{ pkgs, config, lib, ... }:

let
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/weather-sdr.nix
    ../../agenix/hosts/weather-sdr/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/raspberry.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    ../nixos/attic.nix

    ../nixos/mosquitto.nix

    ../nixos/rtl_433.nix
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
    hostName = "weather-sdr";
    useNetworkd = true;
  };

  systemd.network = {
    enable = true;

    networks = {
      "10-iot" = {
        matchConfig.Name = "enu1u1u1";
        networkConfig = {
          DHCP = "yes";
          IPv6AcceptRA = false;
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
      "--interface=enu1u1u1"
    ];
  };

  services.journald.extraConfig = ''
    SystemMaxUse=512M
  '';

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  services.hardware.argonone.enable = true;
  programs.fish.enable = true;

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };

    daniel = {
      passwordFile = config.age.secrets.user-daniel-password.path;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };
  };
}