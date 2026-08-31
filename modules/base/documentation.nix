{
  den.aspects.base = {
    nixos = {
      documentation = {
        nixos.enable = false;
        doc.enable = false;
      };
    };

    darwin = {
      documentation.doc.enable = false;
    };
  };
}
