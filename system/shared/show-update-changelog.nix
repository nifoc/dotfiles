{ config, ... }:

{
  system.activationScripts.show-update-changelog = ''
    if [[ -e /run/current-system ]]; then
      echo "[show-update-changelog] Changelog"
      ${config.nix.package}/bin/nix store diff-closures /run/current-system "$systemConfig" || true
    fi
  '';
}
