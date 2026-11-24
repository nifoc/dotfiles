{ den, ... }:

{
  den.hosts.x86_64-linux.gallium.users.daniel = { };

  den.aspects.gallium = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        zfs
        remote-access

        cli
        dns-resolver
        ntp
        prometheus._.exporters
        tailscale._.peer-relay

        root
        virtual-machine._.amd64-efi
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
          altName = "enp6s18";
          mac = "bc:24:11:f5:ce:e9";
          ipv4 = "77.90.42.205";
          ipv6 = "2a06:de00:401:924c::1";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.80.92.119";
          ipv6 = "fd7a:115c:a1e0::662b:5c78";
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

      dns-resolver = {
        interfaces = [ "tailscale0" ];
        localAccess = false;
      };
    };
  };
}
