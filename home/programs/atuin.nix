{ pkgs, lib, ... }:

{
  programs.atuin = {
    enable = true;

    package = pkgs.atuin.overrideAttrs (
      _: rec {
        nativeCheckInputs = [ ];

        checkPhase = ''
          runHook preCheck
          cargo test
          runHook postCheck
        '';
      }
    );

    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = true;

    settings = {
      auto_sync = true;
      sync_address = "http://100.113.242.85:8015";
      sync_frequency = "1h";
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
