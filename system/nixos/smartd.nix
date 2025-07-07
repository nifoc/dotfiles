{
  pkgs,
  lib,
  config,
  ...
}:

{
  services.smartd = {
    enable = true;

    autodetect = true;

    defaults.monitored = "-a -o on -s S/../.././02";

    notifications = {
      mail = {
        enable = true;
        sender = "server+${config.networking.hostName}@kempkens.io";
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
          "ata-ST10000NT001-3LY101_WP027C6E"
          "ata-WDC_WD100EFAX-68LHPN0_7PKTUMNC"
          "ata-WDC_WD100EFAX-68LHPN0_JEKD2W3N"
        ];

    serviceConfig = {
      Type = "oneshot";
    };
  };
}
