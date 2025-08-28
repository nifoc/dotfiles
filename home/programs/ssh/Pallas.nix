{ pkgs, config, ... }:

let
  ssh-directory = "${config.home.homeDirectory}/.ssh";
  auth-socket = "${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";

  shared-private = import ./shared/private.nix;

  ssh-keys = import ../../../system/shared/ssh-keys.nix;
in
{
  home.packages = [ pkgs.openssh ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    extraConfig = ''
      IdentityAgent "${auth-socket}"
      VerifyHostKeyDNS yes
    '';

    matchBlocks = {
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        hashKnownHosts = true;
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
    }
    // shared-private.matchBlocks;
  };

  home.file = {
    "${ssh-directory}/GitHub.pub".text = ssh-keys.GitHub;
    "${ssh-directory}/GitLab.pub".text = ssh-keys.GitLab;
    "${ssh-directory}/Hetzner.pub".text = ssh-keys.Hetzner;
    "${ssh-directory}/LAN.pub".text = ssh-keys.LAN;
  };

  # Make agent available to all programs

  home.sessionVariables.SSH_AUTH_SOCK = "${auth-socket}";

  launchd.agents.SSH_AUTH_SOCK = {
    enable = true;
    config = {
      ProgramArguments = [
        "/bin/sh"
        "-c"
        "/bin/ln -sf \"${auth-socket}\" $SSH_AUTH_SOCK"
      ];
      RunAtLoad = true;
    };
  };
}
