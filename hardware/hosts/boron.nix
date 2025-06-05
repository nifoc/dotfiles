{ lib, modulesPath, ... }:

{
  imports = [
    "${modulesPath}/profiles/qemu-guest.nix"
    ../disko/boron.nix
  ];

  boot = {
    loader = {
      grub.devices = lib.mkDefault [ "/dev/sda" ];
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "zfs" ];

    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_net"
        "xen_blkfront"
      ];

      kernelModules = [
        "nvme"
        "tls"
      ];

      systemd = {
        enable = true;

        network = {
          networks = {
            "enp1s0" = {
              matchConfig.Name = "enp1s0";
              networkConfig.DHCP = "ipv4";
            };
          };
        };
      };

      network = {
        enable = true;

        ssh =
          let
            ssh-keys = import ../../system/shared/ssh-keys.nix;
          in
          {
            enable = true;
            port = 2222;

            # mkdir -p /etc/secrets/initrd
            # chmod 700 -R /etc/secrets/
            # ssh-keygen -t ed25519 -N "" -f /etc/secrets/initrd/ssh_host_ed25519_key
            hostKeys = [ "/etc/secrets/initrd/ssh_host_ed25519_key" ];
            authorizedKeys = [
              "command=\"systemd-tty-ask-password-agent\" ${ssh-keys.Hetzner}"
              "command=\"systemd-tty-ask-password-agent\" ${ssh-keys.DanielsPhone}"
            ];
          };
      };
    };

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
}
