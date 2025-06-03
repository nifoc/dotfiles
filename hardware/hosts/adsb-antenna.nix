{ lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "tcp_bbr" ];

    blacklistedKernelModules = [
      # SDR
      "rtl2832"
      "dvb_usb_rtl28xxu"
      "rtl2832_sdr"
      # WLAN
      "brcmfmac"
      "brcmutil"
    ];

    kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_syncookies" = 0;
      "net.ipv4.tcp_timestamps" = 1;
      "net.ipv4.tcp_window_scaling" = 1;
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
