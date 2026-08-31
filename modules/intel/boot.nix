{
  den.aspects.intel = {
    nixos =
      { lib, ... }:
      {
        hardware = {
          cpu.intel.updateMicrocode = true;
        };

        boot = {
          initrd = {
            kernelModules = [ "nvme" ];

            availableKernelModules = [
              "xhci_pci"
              "ahci"
              "usbhid"
              "sd_mod"
              "ehci_pci"
              "i40e"
              "igb"
              "igc"
              "realtek"
              "r8169"
            ];
          };

          kernelModules = [
            "coretemp"
            "kvm-intel"
          ];

          blacklistedKernelModules = [
            "mt7921e"
          ];
        };

        powerManagement.cpuFreqGovernor = lib.mkForce "performance";
      };
  };
}
