{ pkgs, ... }:

{
  imports = [
    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/fzf.nix

    ../programs/jq.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      curlFull
      lnav
      mtr
      parallel
      q
      ripgrep
    ];
  };

  programs = {
    zoxide.enable = true;
  };
}
