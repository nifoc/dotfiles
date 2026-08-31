{
  den.aspects.remote-builder = {
    nixos =
      { pkgs, ... }:
      {
        users.users.nix-remote-builder = {
          isNormalUser = true;
          home = "/home/nix-remote-builder";
          description = "Nix Remote Builder";
          shell = pkgs.zsh;
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBIz/JmDKOeO4odKnQWkqPneSp4e55yrHpEiBBX5sfz8"
          ];
        };

        nix.settings.extra-trusted-users = [ "nix-remote-builder" ];
      };
  };
}
