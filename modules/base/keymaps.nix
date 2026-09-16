{
  den.aspects.base = {
    darwin =
      { pkgs, lib, ... }:
      {
        system.activationScripts.applications.text = ''
          echo "setting up /Library/Keyboard Layouts..." >&2

          targetFolder='/Library/Keyboard Layouts'

          rsyncFlags=(
            --checksum
            --copy-unsafe-links
            --archive
            --delete
            --chmod=-w
            --no-group
            --no-owner
          )

          ${lib.getExe pkgs.rsync} "''${rsyncFlags[@]}" ${../../files/base/keymaps}/ "$targetFolder"
        '';
      };
  };
}
