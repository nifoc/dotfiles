{ pkgs, config, lib, ... }:

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
        ${pkgs.nvd}/bin/nvd --nix-bin-dir='${config.nix.package}/bin' diff /run/current-system "$systemConfig"
      fi
    '';

    postActivation = mkIf isDarwin {
      text = ''
        if [[ -e /run/current-system ]]; then
          echo "[show-update-changelog] System Changelog"
          sudo -H ${pkgs.nvd}/bin/nvd --nix-bin-dir='${config.nix.package}/bin' diff /run/current-system "$systemConfig"
        fi
      '';
    };
  };
}
