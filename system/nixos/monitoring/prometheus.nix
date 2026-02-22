{ config, ... }:

{
  services.prometheus = {
    enable = true;
    stateDir = "prometheus";
    retentionTime = "30d";

    globalConfig = {
      scrape_interval = "1m";
    };

    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets =
              let
                port = "${toString config.services.prometheus.exporters.node.port}";
              in
              [
                "argon.ts.kempkens.network:${port}"
                "boron.ts.kempkens.network:${port}"
                "carbon.ts.kempkens.network:${port}"
                "krypton.ts.kempkens.network:${port}"
                "neon.ts.kempkens.network:${port}"
              ];
          }
        ];
      }

      {
        job_name = "smartctl";
        static_configs = [
          {
            targets =
              let
                port = "${toString config.services.prometheus.exporters.smartctl.port}";
              in
              [
                "argon.ts.kempkens.network:${port}"
                "krypton.ts.kempkens.network:${port}"
                "neon.ts.kempkens.network:${port}"
              ];
          }
        ];
      }

      {
        job_name = "caddy";
        static_configs =
          let
            port = "2019";
          in
          [
            {
              targets = [
                "argon.ts.kempkens.network:${port}"
                "boron.ts.kempkens.network:${port}"
                "carbon.ts.kempkens.network:${port}"
                "krypton.ts.kempkens.network:${port}"
                "neon.ts.kempkens.network:${port}"
              ];
            }
          ];
      }

      {
        job_name = "blocky";
        scheme = "https";
        static_configs = [
          {
            targets = [
              "dns-argon.internal.kempkens.network"
              "dns-krypton.internal.kempkens.network"
              "dns-neon.internal.kempkens.network"
            ];
          }
        ];
      }
    ];
  };
}
