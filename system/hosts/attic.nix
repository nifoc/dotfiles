args@{ pkgs, config, lib, ... }:

let
  secret = import ../../secret/hosts/attic.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/attic.nix
    ../../agenix/hosts/attic/config.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    ../nixos/acme-attic.nix
    ../nixos/nginx.nix

    (import ../nixos/atticd.nix (args // { inherit secret; }))

    ../nixos/tailscale.nix
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
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "wurzelpfropf.cachix.org-1:ilZwK5a6wJqVr7Fyrzp4blIEkGK+LJT0QrpWr1qBNq0="
        "nifoc.cachix.org-1:ymuftq7RgN/lf/iWXFK8gpwDSAGFaGBeliWe9u6q8II="
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
    hostName = "attic";
    useNetworkd = true;
  };

  systemd.network = {
    enable = true;

    networks = {
      "10-wan" = {
        matchConfig.Name = "enp1s0";
        networkConfig = {
          DHCP = "ipv4";
          Address = "2a01:4f8:c0c:fa14::1/64";
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
      passwordFile = config.age.secrets.user-daniel-password.path;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ];
    };
  };
}
