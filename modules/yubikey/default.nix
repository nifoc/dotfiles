{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.yubikey = {
    darwin =
      { pkgs, lib, ... }:
      let
        pam_u2f = pkgs.pam_u2f;
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          yubikey-u2f_keys = {
            file = ../../agenix/yubikey/u2f_keys.age;
            path = "/etc/u2f_mappings";
            mode = "640";
            owner = "root";
            group = "wheel";
            symlink = false;
          };
        };

        environment.systemPackages = [ pam_u2f ];

        security.pam.services.sudo_local.text = lib.mkOrder 9999 ''
          auth       sufficient     ${pam_u2f}/lib/security/pam_u2f.so authfile=/etc/u2f_mappings cue
        '';
      };
  };
}
