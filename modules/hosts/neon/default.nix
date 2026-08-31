{ den, ... }:

{
  den.hosts.aarch64-linux.neon.users.daniel = { };

  den.aspects.neon = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        zfs
        remote-access

        cli
        dns-resolver
        hister
        netns._.wireguard
        ntp._.server
        podman
        prometheus._.exporters
        rtl433
        socks-server
        tailscale._.router
        webserver

        root
        private-device
        raspberrypi
      ];
    };

    includes = [
      den.provides.hostname
    ];

    meta = {
      primaryUser = "daniel";

      zfs = {
        ashift = "9";
      };

      firewall = {
        trustedInterfaces = [ "tailscale0" ];
      };

      networking = {
        default = {
          name = "end0";
          altName = "enabcm6e4ei0";
          mac = "d8:3a:dd:e0:d5:50";
          ipv4 = "10.0.0.7";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.111.49.64";
        };
      };

      ssh = {
        authorizedKeys = [
          "DanielsPhone"
          "LAN"
        ];
      };

      smartd = {
        disks = [ "ata-ORICO_251113BH51200097" ];
      };

      ntp = {
        rtc = false;
      };

      webserver = {
        internal = true;
        ech = false;
        extraDefaultHosts = [ ];
      };

      netns.wireguard = [
        {
          name = "hi";
          veth = {
            hostIP = "192.168.42.1";
            nsIP = "192.168.42.2";
            ports = [ 4433 ];
          };
          services = [ "hister" ];
          quadlets = [ ];
        }
      ];

      mqtt = {
        rtl433 = {
          host = "10.0.0.5";
          port = 1883;
          user = "rtl";
          password = "didYouFindThis";
          topic = "rtl433";
        };
      };
    };
  };
}
