{ pkgs, config, ... }:

let
  secret = import ../../../secret/hosts/Styx.nix;

  ssh-directory = "${config.home.homeDirectory}/.ssh";
  auth-socket = "${ssh-directory}/1password.sock";
  signers-directory = "${ssh-directory}/allowed_signers";

  shared-private = import ./shared/private.nix;
  shared-builder = import ./shared/builder.nix;
  shared-work = import ./shared/work.nix { inherit secret; };

  ssh-keys = import ../../../system/shared/ssh-keys.nix;
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

    matchBlocks = shared-private.matchBlocks // shared-builder.matchBlocks // shared-work.matchBlocks;

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
      source = ../../config/ssh/allowed_signers;
      recursive = true;
    };
  };
}
