{ pkgs, lib, ... }:

let
  mas = pkgs.mas;
in
{
  environment.systemPackages = [ mas ];

  system.activationScripts.postUserActivation.text =
    let
      applications = [
        "870330316" # Clear Clipboard
        "640199958" # Developer
        "1475387142" # Tailscale
      ];
    in
    ''
      echo "setting up App Store applications..."
      ${mas}/bin/mas install ${lib.concatStringsSep " " applications}
    '';
}
