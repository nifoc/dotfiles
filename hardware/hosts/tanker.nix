{
  pkgs,
  lib,
  config,
  modulesPath,
  ...
}:

{
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
    ../disko/tanker.nix
  ];

  boot = {
    loader.grub = {
      enable = true;

      copyKernels = true;
      devices = [
        "/dev/nvme0n1"
        "/dev/nvme1n1"
      ];
      efiInstallAsRemovable = true;
      efiSupport = true;
      fsIdentifier = "uuid";
    };

    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "sd_mod"
      ];
      kernelModules = [
        "kvm-amd"
        "tls"
      ];
    };

    swraid = {
      enable = true;
      mdadmConf = ''
        MAILADDR daniel+tanker@kempkens.io
      '';
    };

    kernelPackages = pkgs.linuxPackages;
    kernelModules = [ "tcp_bbr" ];

    kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_syncookies" = 1;
      "net.ipv4.tcp_timestamps" = 1;
      "net.ipv4.tcp_window_scaling" = 1;
      "net.ipv4.tcp_fastopen" = 3;
      "net.core.rmem_max" = 2500000;
      "net.core.wmem_max" = 2500000;
      "vm.overcommit_memory" = lib.mkForce 1;
    };
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
}
