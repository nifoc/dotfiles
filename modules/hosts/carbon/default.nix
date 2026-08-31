{ den, ... }:

{
  den.hosts.aarch64-linux.carbon.users.daniel = { };

  den.aspects.carbon = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        zfs
        remote-access

        cli
        database-server
        esphome
        fail2ban
        forgejo
        geoip-updater
        gotosocial
        ntp
        personal-websites
        podman
        prometheus._.exporters
        remote-builder
        restic
        tailscale
        vaultwarden
        webserver
        woodpecker
        xmpp-server

        root
        virtual-machine._.arm64
      ];
    };

    includes = [
      den.provides.hostname
    ];

    meta = {
      primaryUser = "daniel";

      zfs = {
        ashift = "12";
      };

      firewall = {
        trustedInterfaces = [ "tailscale0" ];
      };

      networking = {
        default = {
          name = "eth0";
          altName = "enp1s0";
          mac = "96:00:04:1c:21:32";
          ipv4 = "49.12.228.29";
          ipv6 = "2a01:4f8:1c1b:9a20::2";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.97.247.57";
          ipv6 = "fd7a:115c:a1e0::8a01:f739";
        };
      };

      ssh = {
        authorizedKeys = [
          "DanielsPhone"
          "Hetzner"
        ];
      };

      smartd.disks = [ ];

      ntp = {
        rtc = false;
      };

      restic = {
        remote = {
          user = "u345${toString (103 + 100)}-sub1";
          host = "u345${toString (103 + 100)}-sub1.your-storagebox.de";
        };

        secondary = {
          enabled = true;
        };
      };

      webserver = {
        internal = false;
        ech = true;
        extraDefaultHosts = [
          "*.kempkens.io"
          "*.daniel.xxx"
        ];
      };

      xmpp-server = {
        domain = "burning.computer";
      };
    };
  };
}
