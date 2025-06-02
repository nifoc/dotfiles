{ pkgs, lib, ... }:

{
  services.munin-node = {
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
      "zfs-filesystem-graph"
      "zfs_usage_*"
    ];

    extraPluginConfig =
      let
        inherit (lib) getExe;
      in
      ''
        [diskstat_*]
          user root
          group disk

        [ipmi_*]
          user root

        [samba]
          user root

        [smart_*]
          user root
          group disk
          env.smartpath ${getExe pkgs.smartmontools}

        [sshd_log]
          group systemd-journal
          env.logfile journald
          env.journalctlargs --unit=sshd.service
      '';

    extraAutoPlugins =
      let
        contrib = pkgs.fetchFromGitHub {
          owner = "munin-monitoring";
          repo = "contrib";
          rev = "172ce3c6709d297b9af46daaefdc6e2492bc68fe";
          hash = "sha256-qoqpZVarFRXxk0HVvsl9b+egyK5xEcmAIxKoIQxPRak=";
        };
      in
      [
        "${contrib}/plugins/chrony"
        "${contrib}/plugins/nginx"
        "${contrib}/plugins/ssh"
        "${contrib}/plugins/zfs"
      ];
  };

  systemd.services.munin-node.path = with pkgs; [
    ipmitool
    lm_sensors
    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
    ]))
  ];

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 4949 ];
}
