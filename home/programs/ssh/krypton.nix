{ pkgs, config, ... }:

let
  ssh-directory = "${config.home.homeDirectory}/.ssh";

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
      UpdateHostKeys ask
      # VerifyHostKeyDNS yes
    '';
  };

  home.file = {
    "${ssh-directory}/GitHub.pub".text = ssh-keys.GitHub;
  };
}
