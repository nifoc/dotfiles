{ pkgs, lib, ... }:

{
  system.activationScripts.postUserActivation.text = ''
    echo "setting up fake Homebrew binaries..."

    current_user="$USER"
    sudo -H mkdir -p /opt/homebrew/bin
    sudo -H chown "$current_user:staff" /opt/homebrew/bin

    sudo -H -u "$current_user" ln -sfn ${lib.getExe pkgs.python3} /opt/homebrew/bin/python3
  '';
}
