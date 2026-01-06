{ pkgs, ... }:

{
  services.hardware.argonone = {
    enable = true;

    package = pkgs.argononed.overrideAttrs (
      _: _: {
        version = "unstable-2025-12-26";

        src = pkgs.fetchFromGitLab {
          owner = "DarkElvenAngel";
          repo = "argononed";
          rev = "34d70b3bb1b2a8ba4b146ba7d9962dd0d925e67e";
          hash = "sha256-f7YGoky4C5P/Iyez3kuLEKU/yWKZ4Dh6Cy//PAKMYuU=";
        };

        patches = [ ];
      }
    );
  };
}
