{ den, ... }:

{
  den.hosts.x86_64-linux.boron.users.daniel = { };

  den.aspects.boron = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        zfs
        remote-access

        cli
        database-server
        dns-resolver
        esphome
        forgejo._.runner
        home-proxy
        mail-security
        miniflux
        nix-cache
        ntp
        oidc-provider
        podman
        prometheus._.exporters
        remote-builder
        restic
        tailscale
        webserver._.storage
        woodpecker._.agent

        root
        virtual-machine._.amd64
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
          mac = "96:00:04:1f:07:53";
          ipv4 = "138.199.219.102";
          ipv6 = "2a01:4f8:1c1c:d840::2";
        };

        tailscale = {
          name = "tailscale0";
          ipv4 = "100.90.7.38";
          ipv6 = "fd7a:115c:a1e0::2101:727";
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

      restic = {
        remote = {
          user = "u345${toString (103 + 100)}-sub2";
          host = "u345${toString (103 + 100)}-sub2.your-storagebox.de";
        };
      };

      webserver = {
        internal = false;
        ech = true;
        extraDefaultHosts = [
          "*.kempkens.io"
          "*.kempkens.email"
          "*.kempkens.li"
        ];
      };
    };
  };
}
