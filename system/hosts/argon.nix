args@{ pkgs, config, ... }:

let
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/argon.nix
    ../../agenix/hosts/argon/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/raspberry.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix

    ../nixos/git.nix

    ../nixos/acme-argon.nix
    ../nixos/nginx.nix
    ../nixos/nginx-argon.nix

    ../nixos/attic.nix

    ../nixos/chrony.nix

    (import ../nixos/controld.nix (args // { podmanDNS = true; }))

    ../nixos/munin/node.nix

    ../nixos/mosquitto.nix

    ../nixos/tailscale-router.nix
    ../nixos/tailscale-nodns.nix

    ../nixos/unbound.nix

    ../nixos/uptime-kuma.nix

    ../nixos/weewx.nix
    ../nixos/weewx-proxy.nix
    ../nixos/temper.nix
  ];

  system.stateVersion = "22.11";

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      log-lines = 25;
      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      extra-substituters = [
        "https://nix-cache.kempkens.network/nifoc-systems?priority=30"
        "https://nix-cache.kempkens.network/nifoc-ci?priority=35"
        "https://nix-community.cachix.org?priority=50"
        "https://cache.garnix.io?priority=60"
        "https://cache.lix.systems?priority=70"
      ];

      extra-trusted-public-keys = [
        "nifoc-systems:jLf2XYhCdf7/VAT7c2sIgaqm/1+NCXwapE2qs5fGrEw="
        "nifoc-ci:YGmPyqh3kbF7eQhMX9esbQpdYU4f3Q+WEx+sv97KKHo="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
      ];

      trusted-users = [
        "root"
        "nix-remote-builder"
      ];

      connect-timeout = 5;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

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
    };

    networks = {
      "10-lan" = {
        matchConfig.Name = "end0";
        vlan = [
          "vlan51"
          "vlan777"
        ];
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

  power.ups = {
    enable = true;
    mode = "standalone";
    openFirewall = true;

    ups.primary = {
      description = "APC Back-UPS BX - BX950U-GR";
      driver = "usbhid-ups";
      port = "auto";
    };

    users.upsmon = {
      passwordFile = config.age.secrets.ups-primary-password.path;
      upsmon = "primary";
    };

    upsd.listen = [
      { address = "127.0.0.1"; }
      { address = "10.0.0.5"; }
    ];

    upsmon.monitor.primary.user = "upsmon";
  };

  programs = {
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
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        ssh-keys.LAN
        ssh-keys.DanielsPhone
      ];
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
