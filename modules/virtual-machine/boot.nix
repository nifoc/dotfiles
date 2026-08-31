{
  den.aspects.virtual-machine = {
    nixos =
      { lib, ... }:
      {
        boot = {
          initrd = {
            # Partially based on https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/profiles/qemu-guest.nix

            kernelModules = [
              "nvme"

              # profile
              "virtio_balloon"
              "virtio_console"
              "virtio_rng"
              "virtio_gpu"
            ];

            availableKernelModules = [
              "ata_piix"
              "uhci_hcd"
              "xen_blkfront"

              # profile
              "virtio_net"
              "virtio_pci"
              "virtio_mmio"
              "virtio_blk"
              "virtio_scsi"
              "9p"
              "9pnet_virtio"
              "virtiofs"
            ];
          };
        };

        powerManagement.cpuFreqGovernor = lib.mkForce "performance";
      };
  };
}
