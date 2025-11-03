{ pkgs, lib, ... }:

{
  programs.lazygit = {
    enable = true;

    settings = {
      gui = {
        theme = {
          activeBorderColor = [
            "#FF79C6"
            "bold"
          ];
          inactiveBorderColor = [ "#BD93F9" ];

          searchingActiveBorderColor = [
            "#8BE9FD"
            "bold"
          ];

          optionsTextColor = [ "#6272A4" ];

          selectedLineBgColor = [ "#6272A4" ];

          inactiveViewSelectedLineBgColor = [ "bold" ];

          cherryPickedCommitFgColor = [ "#6272A4" ];

          cherryPickedCommitBgColor = [ "#8BE9FD" ];

          markedBaseCommitFgColor = [ "#8BE9FD" ];

          markedBaseCommitBgColor = [ "#F1FA8C" ];

          unstagedChangesColor = [ "#FF5555" ];

          defaultFgColor = [ "#F8F8F2" ];
        };
      };

      git = {
        pagers = [
          {
            pager = "${lib.getExe pkgs.delta} --dark --syntax-theme=Dracula --paging=never";
            colorArg = "always";
          }

          {
            externalDiffCommand = "${lib.getExe pkgs.difftastic} --color=always";
          }
        ];

        autoFetch = false;
        autoRefresh = false;
      };

      update.method = "never";

      disableStartupPopups = true;
    };
  };
}
