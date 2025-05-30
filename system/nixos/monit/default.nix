{
  pkgs,
  config,
  lib,
  ...
}:

{
  services = {
    monit = {
      enable = true;

      config =
        let
          inherit (pkgs) writeShellApplication;
          inherit (lib) getExe;
          inherit (lib.strings) concatMapStringsSep;

          turbostat = writeShellApplication {
            name = "monit-turbostat";

            runtimeInputs = with pkgs; [
              config.boot.kernelPackages.turbostat
              coreutils
            ];

            bashOptions = [ "nounset" ];

            text = builtins.readFile ./scripts/turbostat.sh;
          };

          sensors = writeShellApplication {
            name = "monit-sensors";

            runtimeInputs = with pkgs; [
              gawk
              lm_sensors
            ];

            bashOptions = [ "nounset" ];

            text = builtins.readFile ./scripts/sensors.sh;
          };

          top10 = writeShellApplication {
            name = "monit-top10";

            runtimeInputs = with pkgs; [
              coreutils
              unixtools.top
            ];

            text = ''
              top -n1 -b | head -n17
            '';
          };

          ifStats = writeShellApplication {
            name = "monit-if-stats";

            runtimeInputs = with pkgs; [
              iproute2
            ];

            bashOptions = [ ];

            text = builtins.readFile ./scripts/if_stats.sh;
          };

          fwStats = writeShellApplication {
            name = "monit-fw-stats";

            runtimeInputs = with pkgs; [
              iproute2
              iptables
            ];

            bashOptions = [ ];

            text = builtins.readFile ./scripts/fw_stats.sh;
          };

          zfsPoolHealth = writeShellApplication {
            name = "monit-zfs-pool-health";

            runtimeInputs = with pkgs; [
              config.boot.zfs.package
              coreutils
              gawk
              gnugrep
            ];

            bashOptions = [ "nounset" ];

            text = builtins.readFile ./scripts/zfs_pool_health.sh;
          };

          hdTemp = writeShellApplication {
            name = "monit-hd-temp";

            runtimeInputs = with pkgs; [
              jq
              smartmontools
            ];

            bashOptions = [ "nounset" ];

            text = builtins.readFile ./scripts/hd_temp.sh;
          };

          hdStatus = writeShellApplication {
            name = "monit-hd-status";

            runtimeInputs = with pkgs; [
              jq
              smartmontools
            ];

            bashOptions = [ "nounset" ];

            text = builtins.readFile ./scripts/hd_status.sh;
          };
        in
        ''
          set daemon 60

          set httpd
            port 2812
            use address 127.0.0.1
            allow localhost

          set limits {
            programOutput:     4 KB,       # check program's output truncate limit
            sendExpectBuffer:  256 B,      # limit for send/expect protocol test
            fileContentBuffer: 512 B,      # limit for file content test
            httpContentBuffer: 1 MB,       # limit for HTTP content test
            networkTimeout:    5 seconds   # timeout for network I/O
            programTimeout:    300 seconds # timeout for check program
            stopTimeout:       30 seconds  # timeout for service stop
            startTimeout:      30 seconds  # timeout for service start
            restartTimeout:    30 seconds  # timeout for service restart
          }

          check system $HOST
            if loadavg (15min) > 4 for 5 times within 15 cycles then alert
            if memory usage > 80% for 4 cycles then alert
            if swap usage > 20% for 4 cycles then alert

          check network eth0 with interface eth0
            if link down then alert
            if changed link capacity then alert
            if saturation > 90% for 4 cycles then alert

          check network tailscale0 with interface tailscale0
            if link down then alert

          check program turbostat with path "${getExe turbostat}"
            if status != 0 then alert

          check program sensors with path "${getExe sensors} coretemp-isa-0000"
            if status > 70 for 4 cycles then alert

          check program top10 with path "${getExe top10}"
            if status != 0 then alert

          check program zfs_pool_health with path "${getExe zfsPoolHealth} 90 6048000"
            if status != 0 then alert
            group zfs
        ''
        + (concatMapStringsSep "\n"
          (disk: ''
            check program drive_temp_${disk} with path "${getExe hdTemp} ${disk}"
              every 5 cycles
              if status > 40 then alert
              group disk

            check program drive_status_${disk} with path "${getExe hdStatus} ${disk}"
              every 120 cycles
              if status > 0 then alert
              group disk
          '')
          [
            "ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204686N"
            "ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204574J"
            "ata-ST10000NE0008-2JM101_ZPW0MSB4"
            "ata-ST10000NE0008-2JM101_ZPW0N01M"
            "ata-ST14000NE0008-2RX103_ZTM0CFC2"
            "ata-ST14000NE0008-2RX103_ZTM0HSKH"
            "ata-ST16000NE000-2RW103_ZL2PXPP3"
            "ata-ST16000NE000-2RW103_ZL2PZ6XX"
            "ata-ST6000VN001-2BB186_ZCT2ZWZC"
            "ata-ST8000NE001-2M7101_WSDA0W75"
            "ata-WDC_WD100EFAX-68LHPN0_7PKTUMNC"
            "ata-WDC_WD100EFAX-68LHPN0_JEKD2W3N"
            "ata-INTEL_SSDSC2BB080G6_PHWA635201X5080BGN"
          ]
        )
        + (concatMapStringsSep "\n"
          (interface: ''
            check program if_stats_${interface.name} with path "${getExe ifStats} ${interface.name} ${interface.namespace}"
              every 5 cycles
              if status != 0 then alert
              group network 
          '')
          [
            {
              name = "eth0";
              namespace = "";
            }

            {
              name = "tailscale0";
              namespace = "";
            }

            {
              name = "wgsc0";
              namespace = "sc";
            }

            {
              name = "wgdl0";
              namespace = "dl";
            }
          ]
        )
        + (concatMapStringsSep "\n"
          (firewall: ''
            check program fw_stats_${firewall.namespace} with path "${getExe fwStats} ${firewall.namespace}"
              every 5 cycles
              if status != 0 then alert
              group network 
          '')
          [
            {
              namespace = "sc";
            }

            {
              namespace = "dl";
            }
          ]
        );
    };

    nginx =
      let
        fqdn = "monit-krypton.internal.kempkens.network";
      in
      {
        tailscaleAuth.virtualHosts = [ fqdn ];

        virtualHosts."${fqdn}" = {
          quic = true;
          http3 = true;

          onlySSL = true;
          useACMEHost = "internal.kempkens.network";

          locations."/" = {
            recommendedProxySettings = true;
            proxyPass = "http://127.0.0.1:2812";
          };
        };
      };
  };
}
