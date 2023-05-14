{ pkgs, config, ... }:

{
  system.activationScripts.show-update-changelog = ''
    ${pkgs.nvd}/bin/nvd --nix-bin-dir='${config.nix.package}/bin' diff $(ls -d /nix/var/nix/profiles/system-*-link | tail -n2)
  '';
}
