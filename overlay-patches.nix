self: super: {
  fennel-luajit = super.fennel.overrideAttrs (
    o: rec {
      buildInputs = [ super.luajit ];
    }
  );
}
