{
  programs.texlive = {
    enable = true;

    extraPackages = tpkgs: {
      inherit (tpkgs) scheme-small collection-fontsrecommended;
    };
  };
}
