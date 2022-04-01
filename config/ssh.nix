{ config, ... }:

let
  signers-directory = "${config.home.homeDirectory}/.ssh/allowed_signers";
in
{
  programs.ssh = {
    enable = true;

    forwardAgent = false;
    compression = false;
    hashKnownHosts = true;
    serverAliveInterval = 60;
    extraConfig = ''
      UpdateHostKeys ask
      VerifyHostKeyDNS yes
    '';

    matchBlocks = {
      # Work

      "git.app.nedeco.de" = {
        port = 22;
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

      # Private

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
      };

      "nas" = {
        hostname = "10.0.0.100";
        port = 22;
        user = "daniel";
        identityFile = "~/.ssh/LAN.pub";
        identitiesOnly = true;
        compression = true;
      };
    };

    includes = [
      "~/.ssh/config_work"
    ];
  };

  home.sessionVariables.SSH_AUTH_SOCK = "${config.home.homeDirectory}/.ssh/1password.sock";

  home.file."${signers-directory}" = {
    source = ../config/ssh/allowed_signers;
    recursive = true;
  };
}
