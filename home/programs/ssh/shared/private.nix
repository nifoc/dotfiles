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

    "git.kempkens.io" = {
      port = 22;
      user = "forgejo";
      identityFile = "~/.ssh/GitHub.pub";
      identitiesOnly = true;
      compression = true;
    };

    "router" = {
      hostname = "10.0.0.1";
      port = 22;
      user = "root";
      setEnv = {
        TERM = "xterm-256color";
      };
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
      setEnv = {
        TERM = "xterm-256color";
      };
    };

    "adsb-antenna" = {
      hostname = "adsb-antenna.laniot";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "carbon" = {
      hostname = "carbon.ts.kempkens.network";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "carbon.ts.kempkens.network" = {
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "carbon-unlock" = {
      hostname = "49.12.228.29";
      port = 2222;
      user = "root";
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "boron" = {
      hostname = "boron.ts.kempkens.network";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "boron.ts.kempkens.network" = {
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "boron-unlock" = {
      hostname = "138.199.219.102";
      port = 2222;
      user = "root";
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };

    "krypton" = {
      hostname = "krypton.ts.kempkens.network";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };

    "krypton-unlock" = {
      hostname = "10.0.0.100";
      port = 2222;
      user = "root";
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

    "neon" = {
      hostname = "neon.ts.kempkens.network";
      port = 22;
      user = "daniel";
      forwardAgent = true;
      identityFile = "~/.ssh/LAN.pub";
      identitiesOnly = true;
    };
  };
}
