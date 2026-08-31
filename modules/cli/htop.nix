{
  den.aspects.cli = {
    nixos = {
      programs.htop = {
        enable = true;
      };
    };

    darwin =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ htop ];
      };
  };
}
