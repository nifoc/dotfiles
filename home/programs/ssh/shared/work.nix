{ secret, ... }:

{
  matchBlocks = {
    "git.app.nedeco.de" = {
      port = 20022;
      user = "git";
      identityFile = "~/.ssh/nedeco_gitlab.pub";
      identitiesOnly = true;
      compression = true;
    };

    "nedeco-smartos-hosting" = {
      host = "10.0.90.*";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/nedeco.pub";
      identitiesOnly = true;
    };

    "msc.nedeco.local" = {
      port = 22;
      user = "root";
      identityFile = "~/.ssh/nedeco.pub";
      identitiesOnly = true;
    };

    "headnode.nedeco-hosting.local" = {
      hostname = "10.0.90.13";
      port = 22;
      user = "root";
      extraOptions = {
        PreferredAuthentications = "password";
      };
    };

    "cnode01.nedeco-hosting.local" = {
      hostname = "10.0.88.45";
      port = 22;
      user = "root";
      proxyCommand = "ssh headnode.nedeco-hosting.local nc -w 120 %h %p";
      extraOptions = {
        PreferredAuthentications = "password";
      };
    };

    "192.168.8.141" = {
      port = 22;
      user = "root";
      identityFile = "~/.ssh/nedeco.pub";
      identitiesOnly = true;
    };
  } // secret.ssh.matchBlocks.work;
}
