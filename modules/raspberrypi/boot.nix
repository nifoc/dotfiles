{
  den.aspects.raspberrypi = {
    nixos = {
      hardware.enableAllHardware = true;

      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };

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
        };

        blacklistedKernelModules = [
          "brcmfmac"
          "hci_uart"
          "btbcm"
          "btintel"
          "btqca"
          "btsdio"
          "bluetooth"
        ];
      };
    };
  };
}
