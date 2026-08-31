{
  den.aspects.base = {
    nixos = {
      boot = {
        kernelModules = [
          "tcp_bbr"
          "tls"
        ];

        kernel.sysctl = {
          "net.core.default_qdisc" = "fq";
          "net.ipv4.tcp_congestion_control" = "bbr";
          "net.ipv4.tcp_syncookies" = 1;
          "net.ipv4.tcp_timestamps" = 1;
          "net.ipv4.tcp_window_scaling" = 1;
          "net.ipv4.tcp_fastopen" = 3;
          "net.core.rmem_max" = 2500000;
          "net.core.wmem_max" = 2500000;
        };

        tmp.cleanOnBoot = true;

        swraid.mdadmConf = ''
          MAILFROM server@kempkens.io
          MAILADDR daniel@kempkens.io
        '';
      };
    };
  };
}
