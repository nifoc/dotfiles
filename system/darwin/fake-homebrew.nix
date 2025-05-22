{
  pkgs,
  lib,
  config,
  ...
}:

{
  system.activationScripts.postActivation.text = lib.mkOrder 9000 ''
    echo "setting up fake Homebrew binaries..."

    mkdir -p /opt/homebrew/bin
    chown "${config.system.primaryUser}:staff" /opt/homebrew/bin

    sudo -H -u "${config.system.primaryUser}" ln -sfn ${lib.getExe pkgs.python3} /opt/homebrew/bin/python3
  '';
}
