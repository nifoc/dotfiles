{
  den.aspects.base =
    let
      nixStateVersion = "22.11";
      darwinStateVersion = 5;
    in
    {
      nixos = {
        system.stateVersion = nixStateVersion;
      };

      darwin = {
        system.stateVersion = darwinStateVersion;
      };

      homeManager = {
        home.stateVersion = nixStateVersion;
      };
    };
}
