{
  matchBlocks = {
    "builder-tanker" = {
      hostname = "tanker.ts.kempkens.network";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "builder-mediaserver" = {
      hostname = "mediaserver.ts.kempkens.network";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "builder-argon" = {
      hostname = "argon.ts.kempkens.network";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "builder-adsb-antenna" = {
      hostname = "adsb-antenna.laniot";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "builder-weather-sdr" = {
      hostname = "weather-sdr.laniot";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };
  };
}
