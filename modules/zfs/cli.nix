{
  den.aspects.zfs = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          fclones
        ];
      };
  };
}
