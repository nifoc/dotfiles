{ pkgs, config, ... }:

let
  ssh-directory = "${config.home.homeDirectory}/.ssh";
  ssh-keys = import ../../system/shared/ssh-keys.nix;

  auth-socket = "${ssh-directory}/1password.sock";
  signers-directory = "${ssh-directory}/allowed_signers";

  secret-sail = import ../../secret/hosts/sail.nix;
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
        hostname = secret-sail.publicIP;
        port = 22;
        user = "daniel";
        forwardAgent = true;
        identityFile = "~/.ssh/Hetzner.pub";
        identitiesOnly = true;
      };

      # Builder

      "builder-sail" = {
        hostname = secret-sail.publicIP;
        port = 22;
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

  home.file = {
    "${ssh-directory}/GitHub.pub".text = ssh-keys.GitHub;
    "${ssh-directory}/GitLab.pub".text = ssh-keys.GitLab;
    "${ssh-directory}/Hetzner.pub".text = ssh-keys.Hetzner;
    "${ssh-directory}/LAN.pub".text = ssh-keys.LAN;

    "${signers-directory}" = {
      source = ../config/ssh/allowed_signers;
      recursive = true;
    };
  };
}
