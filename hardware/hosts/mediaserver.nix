{ pkgs, modulesPath, ... }:

let
  latestKernelPackage = pkgs.linuxPackages_latest;
in
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ "ata_piix" "xhci_pci" "ahci" "sd_mod" "sr_mod" "virtio_balloon" ];
      kernelModules = [ "tls" ];
    };

    kernelPackages = latestKernelPackage;
    kernelModules = [ "kvm-intel" "tcp_bbr" ];
    extraModulePackages = [ latestKernelPackage.wireguard ];

    kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.rmem_max" = 2500000;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXROOT";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
    };
  };

  hardware.cpu.intel.updateMicrocode = false;
}
