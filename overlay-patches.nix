self: super: {
  kitty = super.kitty.overrideAttrs (
    o: rec {
      patches = o.patches ++ [ ./patches/kitty/darwin.patch ];
    }
  );
}
