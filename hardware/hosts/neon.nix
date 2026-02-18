{ lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/all-hardware.nix")
    ../disko/neon.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "zfs" ];

    initrd = {
      kernelModules = [
        "usbhid"
        "usb_storage"
        "xhci_pci"
        "nvme"
      ];

      availableKernelModules = [
        "genet"
        "vc4"
        "pcie_brcmstb"
        "reset-raspberrypi"
      ];

      systemd = {
        enable = true;

        network = {
          networks = {
            "enabcm6e4ei0" = {
              matchConfig.Name = "enabcm6e4ei0";
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
              "command=\"systemd-tty-ask-password-agent\" ${ssh-keys.LAN}"
              "command=\"systemd-tty-ask-password-agent\" ${ssh-keys.DanielsPhone}"
            ];
          };
      };
    };

    kernelModules = [ "tcp_bbr" ];

    blacklistedKernelModules = [
      "brcmfmac"
      "hci_uart"
      "btbcm"
      "btintel"
      "btqca"
      "btsdio"
      "bluetooth"
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

  hardware = {
    enableRedistributableFirmware = true;
  };

  powerManagement.cpuFreqGovernor = lib.mkForce "ondemand";
}
