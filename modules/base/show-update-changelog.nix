{
  den.aspects.base = {
    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        system.activationScripts.show-update-changelog = ''
          if [[ -e /run/current-system ]]; then
            echo "[show-update-changelog] System Changelog"
            ${lib.getExe pkgs.lix-diff} --lix-bin ${config.nix.package}/bin /run/current-system "$systemConfig" || true
          fi
        '';
      };

    darwin =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        system.activationScripts.postActivation.text = lib.mkOrder 9999 ''
          if [[ -e /run/current-system ]]; then
            echo "[show-update-changelog] System Changelog"
            sudo -H ${lib.getExe pkgs.lix-diff} --lix-bin ${config.nix.package}/bin /run/current-system "$systemConfig" || true
          fi
        '';
      };
  };
}
