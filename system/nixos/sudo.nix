{
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (lib) optionals;
in
{
  security = {
    sudo.enable = false;

    doas = {
      enable = true;
      extraRules = [
        {
          users =
            (optionals (builtins.hasAttr "daniel" config.users.users) [ "daniel" ])
            ++ (optionals (builtins.hasAttr "nix-remote-builder" config.users.users) [ "nix-remote-builder" ]);
          persist = true;
        }
      ];
    };
  };

  environment.systemPackages = [ pkgs.doas-sudo-shim ];
}
