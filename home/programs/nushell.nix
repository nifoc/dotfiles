{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    shellAliases = {
      nrsw = "nixpkgs-switch";
      upa = "nix flake update ~/.config/nixpkgs -v and upn";
      ngc = "nix-collect-garbage -d and sudo nix-collect-garbage -d";
      nsr = "sudo nix-store --verify --check-contents --repair";

      la = "${pkgs.eza}/bin/eza --long --all --group --header --group-directories-first --sort=type --icons";
      lg = "${pkgs.eza}/bin/eza --long --all --group --header --git";
      lt = "${pkgs.eza}/bin/eza --long --all --group --header --tree --level ";
    };

    configFile = {
      text = ''
        $env.config = {
          show_banner: false

          keybindings: []
        }
      '';
    };
  };
}
