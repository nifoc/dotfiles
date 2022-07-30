{ pkgs, ... }:

{
  imports = [
    ../../hardware/hosts/sail.nix
    ../nixos/ssh.nix

    ../nixos/git.nix

    ../nixos/arion.nix
    ../../container/webserver.nix
  ];

  nix = {
    package = pkgs.nixFlakes;

    binaryCaches = [
      "https://nix-community.cachix.org"
    ];

    binaryCachePublicKeys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-derivations = true
      keep-outputs = true
      auto-optimise-store = true
    '';
  };

  boot.cleanTmpDir = true;

  zramSwap.enable = true;

  networking.hostName = "sail";

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTRKrX0wVWoauI+dSfFpKIr7qwh8imrp1OVlxWyCuFssZI2o6chmRBZq4EbOkVvfdgdOGJ4hTSwQOTwusZVrZHwxtinusX5c2M3HMrhMvLFAYh2vKrvP5UZBTA/7laenSM6uLGxrM2CNc+G8ryAyY7dLoU2xaXiqgcfC6MaU/leTMTXWH5fHvqUk2pxI4ihObTGiDE5kvvFbv3AhFFtcMmkzdHN1vlVp8olKG0lYOLM9O3PpVGJtiOTA2Z9YuTC44iH984HPmk3KkJsK/PZFI1d4K7oW7298w44pszElGwjIW0GyB7X4qo6yOxsq1OsL/c7T9VHWVw3na2QvAJODBNM8rYGMACo8oSEThRsi1hhXPe7MhLPqwhn3OHbbofupbqk7WpKVaMLrO7793DgNatPNhGgbz9WtVCC65YPY3De3sowsh4M4u0HC5lRg0IgjBMgUjMAHWqcxytYRUKPRrdKbcaoOoMquMnja+bcLfHxVOkcLMgEfzPtjxgZCvenUsy0Q73dwxAtJx73xscMZUWb/LbkLWoOzAh3jjyjIeZeT8ZyIOhfcgoxLFE4Ik7eIiszEg0xQ7jXzR+K3RL+2O93RvNTvc5WaDVypiL6Zics30EZAYMYtBoY69a1PxeJ42sLp3O35QNFbwfN4cnsx9YXgvUmTcwCijU/LbvNAgl2Q=="
  ];
}
