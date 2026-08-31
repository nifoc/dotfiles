{
  den.aspects.redis-server = {
    nixos =
      { pkgs, ... }:
      {
        services.redis = {
          package = pkgs.valkey;
          vmOverCommit = true;
        };
      };
  };
}
