{ pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot = {
    loader.grub.device = "/dev/sda";

    initrd = {
      availableKernelModules = [ "ata_piix" "uhci_hcd" "xen_blkfront" ];
      kernelModules = [ "nvme" "tls" ];
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "tcp_bbr" ];

    kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.rmem_max" = 2500000;
    };
  };

  fileSystems."/" = { device = "/dev/sda1"; fsType = "ext4"; };
}
