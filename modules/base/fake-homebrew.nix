{
  den.aspects.base = {
    darwin =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        system.activationScripts.postActivation.text = lib.mkOrder 9000 ''
          echo "setting up fake Homebrew binaries..."

          mkdir -p /opt/homebrew/bin
          chown "${config.system.primaryUser}:staff" /opt/homebrew/bin

          sudo -H -u "${config.system.primaryUser}" ln -sfn ${lib.getExe pkgs.git} /opt/homebrew/bin/git
          sudo -H -u "${config.system.primaryUser}" ln -sfn ${lib.getExe pkgs.python3} /opt/homebrew/bin/python3
        '';

        environment.etc."paths.d/20-fake-homebrew".text = ''
          /opt/homebrew/bin
        '';
      };
  };
}
