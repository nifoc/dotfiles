{ pkgs, ... }:

let
  bw-run = pkgs.writeShellApplication {
    name = "bw-run";

    runtimeInputs = with pkgs; [
      gawk
      rbw
    ];

    text = ''
      if [[ -z "$BW_ENVIRONMENT_NAME" ]]; then
        name="$1"
        shift
      else
        name="$BW_ENVIRONMENT_NAME"
      fi
      shift

      source <(rbw get "$name" | awk '{print "export " $0}')

      exec "$@"
    '';

    bashOptions = [
      "errexit"
      "pipefail"
    ];

    excludeShellChecks = [ "SC1090" ];
  };
in
{
  programs.rbw = {
    enable = true;

    settings = {
      email = "daniel@kempkens.io";
      base_url = "https://vault.kempkens.network/";
      ui_url = "https://vault.kempkens.network/";
      pinentry = pkgs.pinentry_mac;
    };
  };

  home.packages = [ bw-run ];
}
