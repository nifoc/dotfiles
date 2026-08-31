{
  den.aspects.cli = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          gallery-dl
          ffmpeg
        ];
      };
  };
}
