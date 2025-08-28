{ pkgs, config, ... }:

let
  ssh-directory = "${config.home.homeDirectory}/.ssh";

  ssh-keys = import ../../../system/shared/ssh-keys.nix;
in
{
  home.packages = [ pkgs.openssh ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    extraConfig = ''
      UpdateHostKeys ask
      # VerifyHostKeyDNS yes
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
    };
  };

  home.file = {
    "${ssh-directory}/GitHub.pub".text = ssh-keys.GitHub;
  };
}
