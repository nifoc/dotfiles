{ pkgs, lib, ... }:

let
  pam_u2f = pkgs.pam_u2f;
in
{
  environment.systemPackages = [ pam_u2f ];

  security.pam.services.sudo_local = {
    text = lib.mkOrder 9999 ''
      auth       sufficient     ${pam_u2f}/lib/security/pam_u2f.so authfile=/etc/u2f_mappings cue
    '';
  };
}
