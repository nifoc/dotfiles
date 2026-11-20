{ den, ... }:

{
  den.hosts.aarch64-linux.silicon.users.daniel = { };

  den.aspects.silicon = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        zfs
        remote-access

        cli
        dns-resolver
        ntp
        podman
        prometheus._.exporters
        restic
        tailscale._.peer-relay
        unifi-os-server

        root
        virtual-machine._.arm64
      ];
    };

    includes = [
      den.provides.hostname
    ];

    meta = {
      primaryUser = "daniel";

      boot = {
        kernelParams = [ "console=tty" ];
      };

      zfs = {
        ashift = "12";
        devNodes = "/dev/disk/by-path";
      };

      firewall = {
        trustedInterfaces = [ "tailscale0" ];
      };

      networking = {
        default = {
          name = "eth0";
          altName = "enp7s0";
          mac = "1a:3d:53:fe:8b:2f";
          ipv4 = "152.53.33.175";
          ipv6 = "2a0a:4cc0:100:f22::2";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.71.168.103";
          ipv6 = "fd7a:115c:a1e0::df2b:a868";
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
          user = "u345${toString (103 + 100)}-sub8";
          host = "u345${toString (103 + 100)}-sub8.your-storagebox.de";
        };
      };
    };
  };
}
