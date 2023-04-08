{
  matchBlocks = {
    "builder-sail" = {
      hostname = "sail-ts.kempkens.io";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "builder-attic" = {
      hostname = "attic-ts.kempkens.io";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };
  };
}
