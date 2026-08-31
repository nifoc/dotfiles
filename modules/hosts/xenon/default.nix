{ den, ... }:

{
  den.hosts.x86_64-linux.xenon.users.daniel = { };

  den.aspects.xenon = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        zfs
        remote-access

        cli
        frigate
        ntp._.server
        podman
        prometheus._.exporters
        tailscale._.exit-node
        webserver._.tinyauth

        root
        private-device
        intel._.efi
        intel._.igpu
      ];
    };

    includes = [
      den.provides.hostname
    ];

    meta = {
      primaryUser = "daniel";
      primaryUid = 1001;
      primaryGid = 1001;

      zfs = {
        ashift = "12";
        extraPools = [
          "tank"
          "scratch"
        ];
      };

      firewall = {
        trustedInterfaces = [ "tailscale0" ];
      };

      networking = {
        default = {
          name = "eth0";
          altName = "enp2s0";
          mac = "78:55:36:07:b3:8f";
          ipv4 = "10.0.0.101";
        };

        security = {
          name = "vlan50";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.124.128.35";
          ipv6 = "fd7a:115c:a1e0::4e34:8023";
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
          "nvme-YMTC_PC41Q-1TB-B_YMA61T0RA252920LTC"
          "ata-ST4000VX016-3CV104_WW69ENJA"
          "nvme-INTENSO_SSD_1642605001004064"
        ];
      };

      zram = {
        memoryPercent = 20;
      };

      webserver = {
        protocols = "h1 h2";
        internal = true;
        ech = false;
        extraDefaultHosts = [ ];
      };
    };
  };
}
