{ lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelParams = [
      "cgroup_memory=1"
      "cgroup_enable=cpuset"
      "cgroup_enable=memory"
    ];

    kernelModules = [ "tcp_bbr" ];

    blacklistedKernelModules = [
      "brcmfmac"
      "brcmutil"
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
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 4096;
    }
  ];

  networking.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkForce "ondemand";
}
