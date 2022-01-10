{
  programs.ssh = {
    enable = true;

    forwardAgent = false;
    compression = false;
    hashKnownHosts = true;
    serverAliveInterval = 60;
    extraConfig = ''
      IgnoreUnknown UseKeychain,AddKeysToAgent
      UseKeychain yes
      AddKeysToAgent yes
      UpdateHostKeys ask
      VerifyHostKeyDNS yes
    '';

    matchBlocks = {
      # Work

      "git.app.nedeco.de" = {
        port = 22;
        user = "git";
        identitiesOnly = true;
        identityFile = "~/.ssh/nedeco_gitlab";
        compression = true;
      };

      "nedeco-smartos-hosting" = {
        host = "10.0.90.*";
        port = 22;
        user = "root";
        identitiesOnly = true;
        identityFile = "~/.ssh/nedeco";
      };

      # Private

      "github.com" = {
        port = 22;
        user = "git";
        identitiesOnly = true;
        identityFile = "~/.ssh/GitHub";
        compression = true;
      };

      "gitlab.com" = {
        port = 22;
        user = "git";
        identitiesOnly = true;
        identityFile = "~/.ssh/GitLab";
        compression = true;
      };

      "nas" = {
        host = "10.0.0.100";
        port = 22;
        user = "daniel";
        identitiesOnly = true;
        identityFile = "~/.ssh/freenas";
        compression = true;
      };
    };
  };
}
