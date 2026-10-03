{
  den.aspects.cli = {
    homeManager =
      { pkgs, ... }:
      {
        home = {
          packages = [ pkgs.eternal-terminal ];

          sessionVariables.ET_NO_TELEMETRY = "1";
        };
      };
  };
}
