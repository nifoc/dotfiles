{
  programs.nushell = {
    enable = true;

    shellAliases = {
      nrsw = "nixpkgs-switch";
      upa = "update-all";
      ngc = "nix-garbage-collect";
      nsr = "sudo nix-store --verify --check-contents --repair";
    };

    configFile = {
      text = ''
        $env.config = {
          show_banner: false
          keybindings: []
        }

        $env.PATH = ($env.PATH |split row ":"| append $"($env.HOME)/.bin")

        use ~/.config/nushell/scripts/nix-utils.nu *
        use ~/.config/nushell/scripts/media-downloader.nu *
      '';
    };
  };

  xdg.configFile."nushell/scripts" = {
    source = ../config/nushell/scripts;
    recursive = true;
  };
}
