{
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
    ../disko/krypton.nix
  ];

  boot = {
    loader = {
      grub = {
        mirroredBoots = lib.mkForce [
          {
            devices = [ "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204686N" ];
            path = "/boot0";
          }
          {
            devices = [ "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204574J" ];
            path = "/boot1";
          }
        ];

        efiSupport = true;
        efiInstallAsRemovable = true;

        gfxmodeBios = "1024x768";
        gfxpayloadBios = "keep";
      };
    };
    supportedFilesystems = [ "zfs" ];

    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usbhid"
        "sd_mod"
        "ehci_pci"
        "i40e"
        "igb"
      ];

      systemd = {
        enable = true;

        network = {
          networks = {
            "enp1s0f0np0" = {
              matchConfig.Name = "enp1s0f0np0";
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

    kernelModules = [
      "coretemp"
      "kvm-intel"
      "tcp_bbr"
      "tls"
    ];

    kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_syncookies" = 0;
      "net.ipv4.tcp_timestamps" = 1;
      "net.ipv4.tcp_window_scaling" = 1;
      "net.ipv4.tcp_fastopen" = 3;
      "net.core.rmem_max" = 2500000;
      "net.core.wmem_max" = 2500000;
      "vm.overcommit_memory" = lib.mkForce 1;
    };

    zfs = {
      extraPools = [ "dozer" ];
      requestEncryptionCredentials = [ "zroot/root" ];
      forceImportRoot = false;
    };
  };

  environment.variables = {
    SYSTEMD_RELAX_ESP_CHECKS = "1";
  };

  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };

  powerManagement.cpuFreqGovernor = lib.mkForce "ondemand";
}
