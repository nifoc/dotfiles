{
  matchBlocks = {
    "github.com" = {
      port = 22;
      user = "git";
      identityFile = "~/.ssh/GitHub.pub";
      identitiesOnly = true;
      compression = true;
    };

    "gitlab.com" = {
      port = 22;
      user = "git";
      identityFile = "~/.ssh/GitLab.pub";
      identitiesOnly = true;
      compression = true;
    };

    "router" = {
      hostname = "10.0.0.1";
      port = 22;
      user = "root";
      extraOptions = {
        PreferredAuthentications = "password";
      };
    };

    "nas" = {
      hostname = "10.0.0.100";
      port = 22;
      user = "daniel";
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "piboat.lan" = {
      port = 22;
      user = "pi";
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "adsb-antenna" = {
      hostname = "adsb-antenna.laniot";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "sail" = {
      hostname = "sail.ts.kempkens.network";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "attic" = {
      hostname = "attic.ts.kempkens.network";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "mediaserver" = {
      hostname = "mediaserver.ts.kempkens.network";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "argon" = {
      hostname = "argon.ts.kempkens.network";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };
  };
}
