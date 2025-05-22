{
  pkgs,
  config,
  lib,
  ...
}:

let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv) isDarwin;
  inherit (pkgs.stdenv) isLinux;
in
{
  system.activationScripts = {
    show-update-changelog = mkIf isLinux ''
      if [[ -e /run/current-system ]]; then
        echo "[show-update-changelog] System Changelog"
        ${lib.getExe pkgs.nvd} --nix-bin-dir='${config.nix.package}/bin' diff /run/current-system "$systemConfig"
      fi
    '';

    postActivation = mkIf isDarwin {
      text = lib.mkOrder 9999 ''
        if [[ -e /run/current-system ]]; then
          echo "[show-update-changelog] System Changelog"
          sudo -H ${lib.getExe pkgs.nvd} --nix-bin-dir='${config.nix.package}/bin' diff /run/current-system "$systemConfig"
        fi
      '';
    };
  };
}
