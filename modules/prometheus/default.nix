{ den, inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.prometheus = {
    includes = with den.aspects; [
      prometheus._.exporters
    ];

    nixos =
      { config, ... }:
      {
        imports = [ inputs.disko.nixosModules.disko ];

        disko.devices.zpool.zroot.datasets = {
          "root/services/libretranslate" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/libretranslate";
              compression = "zstd";
              atime = "off";
              "com.sun:auto-snapshot" = "false";
            };
            mountpoint = "/var/lib/libretranslate";
          };
        };

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
                      "xenon.ts.kempkens.network:${port}"
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
                      "xenon.ts.kempkens.network:${port}"
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
                      "xenon.ts.kempkens.network:${port}"
                    ];
                  }
                ];
            }

            {
              job_name = "knot-resolver";
              scheme = "https";
              metrics_path = "/metrics/prometheus";
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
      };
  };
}
