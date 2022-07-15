{
  programs.pandoc = {
    enable = true;

    defaults = {
      pdf-engine = "pdflatex";
    };
  };
}
