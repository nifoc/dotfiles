{ pkgs, lib, ... }:

{
  programs.atuin = {
    enable = true;

    package = pkgs.atuin.overrideAttrs (
      oldAttrs: rec {
        version = "13.0.0";

        src = pkgs.fetchFromGitHub {
          owner = "ellie";
          repo = "atuin";
          rev = "v13.0.0";
          hash = "sha256-liuHleJxRrPWOQ5jL3BD8ErbKNGBeRk9Emvfodqy5dQ=";
        };

        cargoDeps = oldAttrs.cargoDeps.overrideAttrs (lib.const {
          name = "${oldAttrs.pname}-${version}-vendor.tar.gz";
          inherit src;
          outputHash = "sha256-0j2daQ9Qj+t3J91lMw4OXdpUViFgPhDDJFMm4QvFohU=";
        });

        checkFlags = [
          "--skip=tui::buffer::tests::index_of_panics_on_out_of_bounds"
          "--skip=tui::buffer::tests::pos_of_panics_on_out_of_bounds"
        ];
      }
    );

    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = true;

    settings = {
      auto_sync = false;
      update_check = false;

      style = "auto";
      search_mode = "fuzzy";
      filter_mode_shell_up_key_binding = "session";

      history_filter = [
        "^base64decode"
      ];
    };
  };
}
