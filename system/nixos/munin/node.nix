{
  pkgs,
  lib,
  config,
  ...
}:

{
  services.munin-node =
    let
      inherit (lib) getExe;
      inherit (lib.strings) concatStringsSep optionalString;
      inherit (lib.lists) optional;

      extra-plugins = import ../../../secret/nixos/munin/plugins.nix;

      contrib = pkgs.fetchFromGitHub {
        owner = "munin-monitoring";
        repo = "contrib";
        rev = "172ce3c6709d297b9af46daaefdc6e2492bc68fe";
        hash = "sha256-qoqpZVarFRXxk0HVvsl9b+egyK5xEcmAIxKoIQxPRak=";
      };
    in
    {
      enable = true;

      extraConfig = ''
        allow ^fd7a:115c:a1e0::d034:bf45$
        allow ^100\.83\.191\.69$
      '';

      disabledPlugins = [
        "munin_stats"
        "df"
        "df_inode"
        "diskstats"
        "proc"
        # Interfaces
        "if_enp1s0f1np1"
        "if_err_enp1s0f1np1"
        "if_enp4s0"
        "if_err_enp4s0"
        "if_enp5s0"
        "if_err_enp5s0"
        "if_veth*"
        "if_err_veth*"
        "if_podman*"
        "if_err_podman*"
        "if_wlan*"
        "if_err_wlan*"
        "vlan_*"
        # Ports
        "port_*"
        # Disks
        "diskstat_iops_md124"
        "diskstat_latency_md124"
        "diskstat_throughput_md124"
        "diskstat_iops_md125"
        "diskstat_latency_md125"
        "diskstat_throughput_md125"
        "diskstat_iops_md126"
        "diskstat_latency_md126"
        "diskstat_throughput_md126"
        "diskstat_iops_md127"
        "diskstat_latency_md127"
        "diskstat_throughput_md127"
        "diskstat_iops_zd*"
        "diskstat_latency_zd*"
        "diskstat_throughput_zd*"
        "diskstat_iops_zram*"
        "diskstat_latency_zram*"
        "diskstat_throughput_zram*"
        # IPMI
        "ipmi_power"
        # NFS
        "nfs4_client"
        "nfs_client"
        # Extra
        "nginx_error"
        "nginx_working_set"
        "timesync_status"
        "zfs-filesystem-graph"
        "zfs_usage_*"
      ];

      extraPluginConfig =
        let
          systemd_mem_services = concatStringsSep " " (
            [
              "munin-node"
              "sshd"
            ]
            ++ optional config.services.nginx.enable "nginx"
            ++ optional config.services.postgresql.enable "postgresql"
            ++ optional config.services.jellyfin.enable "jellyfin"
            ++ optional config.services.gotosocial.enable "gotosocial"
            ++ optional config.services.blocky.enable "blocky"
            ++ optional (builtins.hasAttr "blocky" config.services.redis.servers) "redis-blocky"
            ++ optional config.services.atticd.enable "atticd"
            ++ optional config.services.samba.enable "samba-smbd"
          );

          redis = optionalString (builtins.hasAttr "blocky" config.services.redis.servers) ''
            [redis]
              env.host1 ${config.services.redis.servers.blocky.bind}
              env.port1 ${toString config.services.redis.servers.blocky.port}
              env.password1 "${config.services.redis.servers.blocky.requirePass}"
              env.title_prefix1 blocky
          '';
        in
        concatStringsSep "\n" [
          ''
            [diskstat_*]
              user root
              group disk

            [caddy_*]
              user caddy

            [ipmi_*]
              user root

            [samba]
              user root

            [smart_*]
              user root
              group disk
              env.smartpath ${getExe pkgs.smartmontools}

            [systemd_mem]
              env.services ${systemd_mem_services}

            ${redis}
          ''
          (optionalString (config.networking.hostName == "krypton") extra-plugins.config)
        ];

      extraAutoPlugins = [
        "${contrib}/plugins/chrony"
        "${contrib}/plugins/jellyfin"
        "${contrib}/plugins/redis"
        "${contrib}/plugins/systemd"
        "${contrib}/plugins/zfs"
      ];
    };

  systemd = {
    services.munin-node.path = with pkgs; [
      curl
      ipmitool
      jq
      lm_sensors
      (python3.withPackages (python-pkgs: [
        python-pkgs.requests
      ]))
    ];
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 4949 ];
}
