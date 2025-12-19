args@{
  pkgs,
  lib,
  config,
  ...
}:

let
  ssh-keys = import ../shared/ssh-keys.nix;
in
{
  imports = [
    ../../hardware/hosts/krypton.nix
    ../nixos/zfs.nix
    ../../agenix/hosts/krypton/config.nix
    ../shared/show-update-changelog.nix
    ../nixos/sudo.nix
    ../nixos/ssh.nix
    ../nixos/eternal-terminal.nix
    ../nixos/wezterm-headless.nix
    ../nixos/msmtp.nix
    ../nixos/debugging-tools.nix

    ../nixos/git.nix

    ../nixos/caddy
    ../nixos/postgresql.nix

    ../nixos/attic.nix

    ../nixos/audiobookshelf.nix

    (import ../nixos/blocky.nix (
      args
      // {
        blockyPorts = {
          dns = [
            "10.0.0.100:53"
            "100.83.191.69:53"
          ];

          http = [ "127.0.0.1:8053" ];
        };

        valkeyInstance = {
          bind = "10.0.0.100";
          connect = "10.0.0.100";
          port = 2653;
        };
      }
    ))

    ../nixos/ddg.nix

    (import ../nixos/immich (args // { host = "localhost"; }))

    ../nixos/jellyfin.nix

    ../nixos/libretranslate.nix

    ../nixos/monitoring

    ../nixos/pinchflat.nix

    ../nixos/readeck.nix

    ../nixos/redlib.nix

    ../nixos/restic/krypton.nix

    ../nixos/samba/krypton.nix

    ../nixos/smartd.nix

    ../nixos/speedtest-tracker.nix

    ../nixos/tailscale-router.nix
    ../nixos/tailscale-exit-node.nix
    ../nixos/tailscale-nodns.nix
    ../nixos/tailscale-auth.nix

    ../nixos/valkey.nix

    ../nixos/wireguard/setup.nix
    (import ../nixos/wireguard/namespace.nix (
      args
      // {
        name = "sc";
        veth = {
          hostIP = "192.168.42.5";
          nsIP = "192.168.42.6";

          ports = [
            4000
            4001
            9999
          ];

          hostPorts = [ ];
        };
        configFile = config.age.secrets.wireguard-config-sc;
      }
    ))
    (import ../nixos/wireguard/namespace.nix (
      args
      // {
        name = "dl";
        veth = {
          hostIP = "192.168.42.1";
          nsIP = "192.168.42.2";

          ports = [
            6801
            7878
            8002
            8071
            8080
            8191
            8989
            9696
          ];

          hostPorts = [ ];
        };
        configFile = config.age.secrets.wireguard-config-dl;
      }
    ))
    (import ../nixos/wireguard/namespace.nix (
      args
      // {
        name = "ch";
        veth = {
          hostIP = "192.168.42.9";
          nsIP = "192.168.42.10";

          ports = [
            3000
            7441
            7474
          ];

          hostPorts = [ 443 ];
        };
        configFile = config.age.secrets.wireguard-config-ch;
      }
    ))

    (import ../nixos/vlan-netns.nix (
      args
      // {
        name = "dt";
        vlan = {
          interface = "vlan200";
          ip = "10.0.200.100";
          gateway = "10.0.200.1";
          ns1 = "10.0.200.5";
          ns2 = "10.0.200.7";
        };
      }
    ))

    ../nixos/flaresolverr.nix
    ../nixos/prowlarr.nix
    ../nixos/recyclarr.nix
    ../nixos/unpackerr.nix
    ../nixos/sonarr.nix
    ../nixos/radarr.nix
    ../nixos/convos.nix
    ../nixos/autobrr.nix
    ../nixos/sabnzbd.nix
    ../nixos/qbittorrent.nix

    ../nixos/container.nix
    ../nixos/quadlet.nix
    ../../container/tubearchivist
    ../../secret/nixos/additional-media/media_browser.nix
    ../../secret/nixos/additional-media/scraper.nix
    ../../secret/nixos/additional-media/stash.nix
  ];

  system.stateVersion = "22.11";

  nix = {
    package = pkgs.lixPackageSets.latest.lix;

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
      ];

      extra-trusted-public-keys = [
        "nifoc-systems:jLf2XYhCdf7/VAT7c2sIgaqm/1+NCXwapE2qs5fGrEw="
        "nifoc-ci:YGmPyqh3kbF7eQhMX9esbQpdYU4f3Q+WEx+sv97KKHo="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
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
    tmp.cleanOnBoot = true;
  };

  zramSwap = {
    enable = true;
    writebackDevice = "/dev/zvol/dozer/swap-writeback";
  };

  networking = {
    hostName = "krypton";
    hostId = "364b4220";
    useNetworkd = true;
  };

  systemd = {
    enableEmergencyMode = false;

    settings.Manager = {
      RuntimeWatchdogSec = 20;
      RebootWatchdogSec = 30;
    };

    network = rec {
      enable = true;

      netdevs = {
        "20-vlan200" = {
          netdevConfig = {
            Kind = "vlan";
            Name = "vlan200";
          };
          vlanConfig.Id = 200;
        };
      };

      networks = {
        "10-lan" = {
          matchConfig.Name = "eth0";
          vlan = [ "vlan200" ];
          networkConfig = {
            DHCP = "yes";
            IPv6AcceptRA = true;
            IPv6PrivacyExtensions = true;
          };
          linkConfig.RequiredForOnline = "routable";

          ntp = [
            "10.0.0.5"
            "10.0.0.7"
          ];
        };

        "20-dtag" = {
          matchConfig.Name = "vlan200";
          networkConfig = {
            DHCP = "no";
            IPv6AcceptRA = false;
          };
          linkConfig = {
            ActivationPolicy = "down";
          };
        };
      };

      wait-online.extraArgs = [
        "--interface=${networks."10-lan".matchConfig.Name}"
      ];
    };

    sleep.extraConfig = ''
      AllowSuspend=no
      AllowHibernation=no
    '';
  };

  services = {
    udev.extraRules = ''
      ATTR{address}=="40:a6:b7:c1:7d:38", NAME="eth0"
    '';

    journald.extraConfig = ''
      SystemMaxUse=4G
      MaxRetentionSec=30day
    '';
  };

  services.zfs =
    let
      inherit (lib) mkForce;
    in
    {
      autoSnapshot = {
        daily = mkForce 7;
      };

      autoScrub = {
        interval = mkForce "quarterly";
        pools = [ "dozer" ];
      };
    };

  documentation = {
    nixos.enable = false;
    doc.enable = false;
  };

  power.ups = {
    enable = true;
    mode = "standalone";
    openFirewall = true;

    ups.primary = {
      description = "Back-UPS RS 900G";
      driver = "usbhid-ups";
      port = "auto";
    };

    users.upsmon = {
      passwordFile = config.age.secrets.ups-primary-password.path;
      upsmon = "primary";
    };

    upsd.listen = [
      { address = "127.0.0.1"; }
      { address = "10.0.0.100"; }
    ];

    upsmon.monitor.primary.user = "upsmon";
  };

  fonts.fontconfig.enable = false;

  programs = {
    htop.enable = true;
    zsh.enable = true;
  };

  users = {
    groups = {
      daniel.gid = 1001;
      user_media.gid = 2001;
    };

    users = {
      root = {
        openssh.authorizedKeys.keys = [ ssh-keys.LAN ];
      };

      daniel = {
        uid = 1001;
        hashedPasswordFile = config.age.secrets.user-daniel-password.path;
        isNormalUser = true;
        home = "/home/daniel";
        description = "Daniel";
        extraGroups = [
          "daniel"
          "user_media"
          "wheel"
        ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
          ssh-keys.LAN
          ssh-keys.DanielsPhone
        ];
      };

      media_user = {
        uid = 2001;
        group = "user_media";
        isSystemUser = true;
        description = "Media User";
        home = "/var/lib/media_user";
        createHome = true;
        autoSubUidGidRange = true;
      };
    };
  };
}
