{ pkgs, ... }:

{
  imports = [
    ../programs/zsh
    ../programs/direnv.nix
    ../programs/fzf.nix
    ../programs/starship.nix
    ../programs/zoxide.nix

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/btop.nix

    ../programs/jq.nix

    ../programs/scripts.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      curl
      lnav
      mtr
      parallel
      q
      ripgrep
    ];
  };
}
