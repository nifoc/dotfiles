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
        tailscale

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
          altName = "enp0s3";
          mac = "fa:16:3e:67:eb:a4";
          ipv4 = "51.89.118.129";
          ipv6 = "2001:41d0:701:1000::3ee7";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.87.42.122";
          ipv6 = "fd7a:115c:a1e0::9134:2a7b";
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
