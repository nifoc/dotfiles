{ secret, ... }:

{
  matchBlocks = {
    "git.app.nedeco.de" = {
      port = 22;
      user = "git";
      identityFile = "~/.ssh/nedeco_gitlab.pub";
      identitiesOnly = true;
      compression = true;
    };

    "msc.nedeco.local" = {
      port = 22;
      user = "root";
      identityFile = "~/.ssh/nedeco.pub";
      identitiesOnly = true;
    };

    "192.168.8.141" = {
      port = 22;
      user = "root";
      identityFile = "~/.ssh/nedeco.pub";
      identitiesOnly = true;
    };
  } // secret.ssh.matchBlocks.work;
}
