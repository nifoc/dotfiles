{ inputs, ... }:

{
  flake-file.inputs = {
    run0-sudo-shim.url = "github:lordgrimmauld/run0-sudo-shim";
  };

  den.aspects.base = {
    nixos = {
      imports = [ inputs.run0-sudo-shim.nixosModules.default ];

      security = {
        sudo.enable = false;

        polkit.persistentAuthentication = true;
        run0-sudo-shim.enable = true;
      };
    };

    darwin = {
      security = {
        pam.services.sudo_local = {
          touchIdAuth = true;
          watchIdAuth = true;
        };

        sudo.extraConfig = ''
          Defaults pwfeedback
        '';
      };
    };
  };
}
