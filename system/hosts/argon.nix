args@{ pkgs, config, lib, ... }:

let
  secret = import ../../secret/hosts/argon.nix;
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/argon.nix
    ../../agenix/hosts/argon/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/raspberry.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    ../nixos/acme-argon.nix
    ../nixos/nginx.nix
    ../nixos/nginx-argon.nix

    (import ../nixos/adguardhome.nix (args // { inherit secret; }))

    ../nixos/attic.nix

    (import ../nixos/forgejo-runner.nix (args // { name = "argon"; tag = "ubuntu-latest-arm64"; nixTag = "arm64"; }))

    ../nixos/tailscale.nix

    ../nixos/unbound.nix

    ../nixos/uptime-kuma.nix

    ../nixos/weewx-proxy.nix

    ../nixos/container.nix
    ../nixos/adguardhome-sync.nix
    ../nixos/homebridge.nix
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
      ];

      trusted-public-keys = [
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
        "nifoc-ci:JpD9zqVQi8JuS7B8htPDOQZh08rhInMnGFS9RVhiuwk="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      trusted-users = [
        "root"
        "nix-remote-builder"
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

  environment.etc."nix/netrc".source = ../../secret/shared/nix-netrc;

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };

    tmp.cleanOnBoot = true;
  };

  networking = {
    hostName = "argon";
    useNetworkd = true;
  };

  environment.etc."resolv.conf".text = lib.mkForce ''
    nameserver 127.0.0.1
    nameserver 10.0.0.110
    options edns0 trust-ad
    search .
  '';

  services.resolved.extraConfig = ''
    DNSStubListener=no
  '';

  systemd.network = {
    enable = true;

    netdevs = {
      "20-vlan10" = {
        netdevConfig = {
          Kind = "vlan";
          Name = "vlan51";
        };
        vlanConfig.Id = 51;
      };

      "20-vlan20" = {
        netdevConfig = {
          Kind = "vlan";
          Name = "vlan777";
        };
        vlanConfig.Id = 777;
      };
    };

    networks = {
      "10-lan" = {
        matchConfig.Name = "end0";
        vlan = [ "vlan51" "vlan777" ];
        networkConfig = {
          DHCP = "yes";
          IPv6AcceptRA = true;
          IPv6PrivacyExtensions = true;
        };
        linkConfig.RequiredForOnline = "routable";

        ntp = [
          "ptbtime1.ptb.de"
          "ptbtime2.ptb.de"
          "ptbtime3.ptb.de"
        ];
      };

      "20-iot" = {
        matchConfig.Name = "vlan51";
        networkConfig = {
          DHCP = "no";
          IPv6AcceptRA = false;
        };
        address = [ "10.0.51.5/24" ];
        linkConfig.RequiredForOnline = "routable";
      };

      "30-modem" = {
        matchConfig.Name = "vlan777";
        networkConfig = {
          DHCP = "no";
          IPv6AcceptRA = false;
        };
        address = [ "192.168.1.5/24" ];
        linkConfig.RequiredForOnline = "routable";
      };
    };

    wait-online.extraArgs = [
      "--interface=end0"
    ];
  };

  services.journald.extraConfig = ''
    SystemMaxUse=512M
    MaxRetentionSec=30day
  '';

  security.sudo.enable = true;

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  services.hardware.argonone.enable = true;

  programs = {
    fish.enable = true;
    zsh.enable = true;
    htop.enable = true;
  };

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };

    daniel = {
      hashedPasswordFile = config.age.secrets.user-daniel-password.path;
      isNormalUser = true;
      home = "/home/daniel";
      description = "Daniel";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
    };

    nix-remote-builder = {
      isNormalUser = true;
      home = "/home/nix-remote-builder";
      description = "Nix Remote Builder";
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [ ssh-keys.NixRemoteBuilder ];
    };
  };
}
