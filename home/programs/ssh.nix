{ pkgs, config, ... }:

let
  auth-socket = "${config.home.homeDirectory}/.ssh/1password.sock";
  signers-directory = "${config.home.homeDirectory}/.ssh/allowed_signers";
in
{
  home.packages = [ pkgs.openssh ];

  programs.ssh = {
    enable = true;

    forwardAgent = false;
    compression = false;
    hashKnownHosts = true;
    serverAliveInterval = 60;
    extraConfig = ''
      IdentityAgent "${auth-socket}"
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

      "msc.nedeco.local" = {
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
      };

      "haven" = {
        hostname = "100.101.243.36";
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

      "webboat" = {
        hostname = "100.99.89.98";
        port = 20022;
        user = "root";
        identityFile = "~/.ssh/Hetzner.pub";
        identitiesOnly = true;
      };
    };

    includes = [
      "~/.ssh/config_work"
    ];
  };

  home.sessionVariables.SSH_AUTH_SOCK = "${auth-socket}";

  home.file."${signers-directory}" = {
    source = ../config/ssh/allowed_signers;
    recursive = true;
  };
}
