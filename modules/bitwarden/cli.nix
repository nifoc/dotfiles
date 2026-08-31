{ den, ... }:

{
  den.aspects.bitwarden = {
    homeManager =
      { pkgs, config, ... }:
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

        pinentry = if pkgs.stdenv.isDarwin then pkgs.pinentry_mac else pkgs.pinentry-tty;
      in
      {
        programs.rbw = {
          enable = true;

          settings = {
            inherit (den.aspects.${config.home.username}.meta) email;
            base_url = "https://vault.kempkens.network/";
            ui_url = "https://vault.kempkens.network/";
            inherit pinentry;
          };
        };

        home.packages = [ bw-run ];
      };
  };
}
