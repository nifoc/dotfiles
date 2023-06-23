{ pkgs, modulesPath, ... }:

{
  imports = [
    ../disko/tanker.nix
  ];

  boot = {
    loader.grub = {
      enable = true;

      copyKernels = true;
      devices = [ "/dev/nvme0n1" "/dev/nvme1n1" ];
      efiInstallAsRemovable = true;
      efiSupport = true;
      fsIdentifier = "uuid";
    };

    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "sd_mod" ];
      kernelModules = [ "tls" ];
    };

    kernelPackages = pkgs.zfs.latestCompatibleLinuxPackages;
    kernelModules = [ "tcp_bbr" ];

    kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_syncookies" = 0;
      "net.ipv4.tcp_timestamps" = 1;
      "net.ipv4.tcp_window_scaling" = 1;
      "net.core.rmem_max" = 2500000;
      "vm.overcommit_memory" = 1;
    };
  };
}
