{ pkgs, lib, ... }:

{
  nix = {
    binaryCaches = [
      "https://nix-community.cachix.org"
    ];

    binaryCachePublicKeys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    trustedUsers = [
      "@admin"
    ];

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-derivations = true
      keep-outputs = true
      auto-optimise-store = true
    '';
  };

  users = {
    nix.configureBuildUsers = true;

    users.daniel = {
      home = "/Users/daniel";
    };
  };

  environment = {
    darwinConfig = "$HOME/.config/nixpkgs/darwin-configuration.nix";
  };

  services = {
    nix-daemon.enable = true;
  };

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}
