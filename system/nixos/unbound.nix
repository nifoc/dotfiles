{ lib, ... }:

{
  services.unbound = {
    enable = true;
    resolveLocalQueries = false;

    settings = {
      server = {
        interface = [ "127.0.0.1" ];
        port = 6053;

        verbosity = 0;

        do-ip4 = true;
        do-ip6 = true;
        do-udp = true;
        do-tcp = true;

        harden-glue = true;
        harden-dnssec-stripped = true;
        use-caps-for-id = false;

        edns-buffer-size = 1232;

        num-threads = 1;
        so-rcvbuf = "1m";

        unblock-lan-zones = true;
        insecure-lan-zones = true;

        private-address = [
          "192.168.0.0/16"
          "169.254.0.0/16"
          "172.16.0.0/12"
          "10.0.0.0/8"
          "100.64.0.0/10"
          "fd00::/8"
          "fe80::/10"
          "fd7a:115c:a1e0::/96"
        ];
      };

      forward-zone = (builtins.map
        (octet:
          {
            name = "${builtins.toString octet}.100.in-addr.arpa.";
            forward-addr = "100.100.100.100";
          })
        (lib.range 64 127)) ++ [
        {
          name = "0.0.0.0.0.0.0.0.0.0.0.0.0.e.1.a.c.5.1.1.a.7.d.f.ip6.arpa.";
          forward-addr = "100.100.100.100";
        }

        {
          name = "in-addr.arpa.";
          forward-addr = "10.0.0.1";
        }
      ];
    };
  };
}
