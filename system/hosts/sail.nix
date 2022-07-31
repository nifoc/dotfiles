args@{ pkgs, ... }:

let
  secret = import ../../secret/hosts/sail.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/sail.nix
    ../nixos/ssh.nix

    ../nixos/git.nix
    (import ../nixos/tailscale.nix (args // { inherit secret; }))

    ../nixos/arion.nix
    ../../container/webserver
  ];

  nix = {
    package = pkgs.nixFlakes;

    binaryCaches = [
      "https://nix-community.cachix.org"
    ];

    binaryCachePublicKeys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-derivations = true
      keep-outputs = true
      auto-optimise-store = true
    '';
  };

  boot.cleanTmpDir = true;

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
      openssh.authorizedKeys.keys = [ ssh-keys.Hetzner ];
    };
  };
}
