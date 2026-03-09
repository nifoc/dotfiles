{
  pkgs,
  config,
  lib,
  ...
}:

let
  domain = "burning.computer";
in
{
  imports = [
    (import ./prosody.nix {
      inherit
        pkgs
        config
        lib
        domain
        ;
    })

    (import ./slidgnal.nix {
      inherit
        pkgs
        config
        lib
        domain
        ;
    })

    (import ./slidge-whatsapp.nix {
      inherit
        pkgs
        config
        lib
        domain
        ;
    })

    (import ./coturn.nix {
      inherit
        pkgs
        config
        lib
        domain
        ;
    })
  ];
}
