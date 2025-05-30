{ pkgs, lib, ... }:

{
  services.smartd = {
    enable = true;

    autodetect = true;

    defaults.monitored = "-a";

    notifications = {
      mail = {
        enable = true;
        sender = "smartd@mg.kempkens.io";
        recipient = "daniel@kempkens.io";
      };

      wall.enable = true;
      x11.enable = false;

      test = false;
    };
  };

  systemd.services.smart-enable-all-drives = {
    description = "Enable SMART on all connected drives";
    before = [ "smartd.service" ];
    wantedBy = [ "multi-user.target" ];

    path = with pkgs; [ smartmontools ];

    script =
      lib.strings.concatMapStringsSep "\n"
        (disk: ''
          smartctl -s on "/dev/disk/by-id/${disk}" || true
        '')
        [
          "ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204686N"
          "ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204574J"
          "ata-ST10000NE0008-2JM101_ZPW0MSB4"
          "ata-ST10000NE0008-2JM101_ZPW0N01M"
          "ata-ST14000NE0008-2RX103_ZTM0CFC2"
          "ata-ST14000NE0008-2RX103_ZTM0HSKH"
          "ata-ST16000NE000-2RW103_ZL2PXPP3"
          "ata-ST16000NE000-2RW103_ZL2PZ6XX"
          "ata-ST6000VN001-2BB186_ZCT2ZWZC"
          "ata-ST8000NE001-2M7101_WSDA0W75"
          "ata-WDC_WD100EFAX-68LHPN0_7PKTUMNC"
          "ata-WDC_WD100EFAX-68LHPN0_JEKD2W3N"
          "ata-INTEL_SSDSC2BB080G6_PHWA635201X5080BGN"
        ];

    serviceConfig = {
      Type = "oneshot";
    };
  };
}
