{ den, ... }:

{
  den.hosts.x86_64-linux.krypton.users.daniel = { };

  den.aspects.krypton = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        zfs
        remote-access

        audiobookshelf
        cli
        database-server
        development
        dns-resolver
        ebook-reader
        flaresolverr
        grafana
        immich
        jellyfin
        libretranslate
        media-downloader
        netns._.vlan
        netns._.wireguard
        ntp
        pinchflat
        podman
        prometheus
        readeck
        redis-server
        restic
        smb-server
        tailscale._.exit-node
        ups
        webdav-server
        webserver._.tinyauth

        root
        media_user
        private-device
        intel._.bios
      ];
    };

    includes = [
      den.provides.hostname
    ];

    meta = {
      primaryUser = "daniel";
      primaryUid = 1001;
      primaryGid = 1001;

      boot = {
        mirroredBoots = [
          {
            devices = [ "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204686N" ];
            path = "/boot0";
          }
          {
            devices = [ "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204574J" ];
            path = "/boot1";
          }
        ];
      };

      zfs = {
        ashift = "12";
        mode = "mirror";
        extraPools = [ "dozer" ];
      };

      firewall = {
        trustedInterfaces = [ "tailscale0" ];
      };

      networking = {
        default = {
          name = "eth0";
          altName = "enp1s0f0np0";
          mac = "40:a6:b7:c1:7d:38";
          ipv4 = "10.0.0.100";
        };

        dtag = {
          name = "vlan200";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.83.191.69";
          ipv6 = "fd7a:115c:a1e0::d034:bf45";
        };
      };

      ssh = {
        authorizedKeys = [
          "DanielsPhone"
          "LAN"
        ];
      };

      smartd = {
        disks = [
          "ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204686N"
          "ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204574J"
          "ata-ST10000NE0008-2JM101_ZPW0MSB4"
          "ata-ST10000NE0008-2JM101_ZPW0N01M"
          "ata-ST14000NE0008-2RX103_ZTM0CFC2"
          "ata-ST14000NE0008-2RX103_ZTM0HSKH"
          "ata-ST16000NE000-2RW103_ZL2PXPP3"
          "ata-ST16000NE000-2RW103_ZL2PZ6XX"
          "ata-ST6000VN001-2BB186_ZCT2ZWZC"
          "ata-ST10000NT001-3LY101_WP027C6E"
          "ata-WDC_WD100EFAX-68LHPN0_7PKTUMNC"
          "ata-WDC_WD100EFAX-68LHPN0_JEKD2W3N"
        ];
      };

      netns = {
        wireguard = [
          {
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
            };
            services = [
              "fff-update"
              "unpackerr"
            ];
            quadlets = [
              "flaresolverr"
              "prowlarr"
              "qbittorrent"
              "radarr"
              "recyclarr"
              "sabnzbd"
              "sonarr"
            ];
          }

          {
            name = "sc";
            veth = {
              hostIP = "192.168.42.5";
              nsIP = "192.168.42.6";
              ports = [
                4000
                4001
                8083
                9999
              ];
            };
            services = [
              "nginx"
              "tor"
            ];
            quadlets = [
              "calibre-web-automated"
              "media_browser"
              "stash"
            ];
          }

          {
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
            services = [ ];
            quadlets = [
              "autobrr"
              "omegabrr"
            ];
          }
        ];

        vlan = [
          {
            name = "dt";
            vlan = {
              tag = 200;
              ip = "10.0.200.100";
              gateway = "10.0.200.1";
              nameserver = [
                "10.0.200.5"
                "10.0.200.7"
              ];
            };
            services = [ "pinchflat" ];
            quadlets = [ ];
          }
        ];
      };

      restic = {
        remote = {
          user = "u345${toString (103 + 100)}-sub3";
          host = "u345${toString (103 + 100)}-sub3.your-storagebox.de";
        };

        secondary = {
          enabled = true;
        };
      };

      smb = {
        shares = {
          HomeDozer = {
            path = "/dozer/home/daniel";
          };

          Instagram = {
            path = "/dozer/home/daniel/Pictures/Instagram";
          };

          MediaScraper = {
            path = "/dozer/JailVault/media-scraper";
            group = "user_media";
          };

          MediaVault = {
            path = "/dozer/MediaVault";
            group = "user_media";
          };

          Media = {
            path = "/dozer/media";
            group = "user_media";
          };

          Downloads = {
            path = "/dozer/downloads";
            group = "user_media";
          };
        };
      };

      zram = {
        memoryPercent = 20;
        writebackDevice = "/dev/zvol/dozer/swap-writeback";
      };

      webserver = {
        internal = true;
        ech = false;
        extraDefaultHosts = [ ];
      };

      ups.primary = {
        description = "Back-UPS RS 900G";
      };
    };
  };
}
