{ den, ... }:

{
  den.hosts.aarch64-linux.argon.users.daniel = { };

  den.aspects.argon = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        zfs
        remote-access

        cli
        dns-resolver
        mqtt-broker
        ntp._.server
        podman
        prometheus._.exporters
        restic
        socks-server
        tailscale._.router
        temper
        unifi-os-server
        ups
        webserver
        weewx

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
          mac = "d8:3a:dd:16:36:ac";
          ipv4 = "10.0.0.5";
        };

        iot = {
          name = "vlan51";
          ipv4 = "10.0.51.5";
        };

        mgmt = {
          name = "vlan100";
          ipv4 = "10.0.100.5";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.116.103.122";
          ipv6 = "fd7a:115c:a1e0::6a3a:677a";
        };
      };

      ssh = {
        authorizedKeys = [
          "DanielsPhone"
          "LAN"
        ];
      };

      smartd = {
        disks = [ "ata-ORICO_251113BH51201906" ];
      };

      ntp = {
        rtc = false;
      };

      restic = {
        remote = {
          user = "u345${toString (103 + 100)}-sub5";
          host = "u345${toString (103 + 100)}-sub5.your-storagebox.de";
        };
      };

      webserver = {
        protocols = "h1 h2 h2c h3";
        internal = true;
        ech = false;
        extraDefaultHosts = [ ];
      };

      mqtt = {
        home-assistant = {
          host = "10.0.0.230";
          port = 1883;
          user = "mqtt_bridge";
          password = "verySecurePassword";
          topic = "hadata";
        };
      };

      ups.primary = {
        description = "CyberPower CP550EPFCLCD";
      };
    };
  };
}
