{
  matchBlocks = {
    "builder-sail" = {
      hostname = "sail.ts.kempkens.network";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "builder-attic" = {
      hostname = "attic.ts.kempkens.network";
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
  };
}
