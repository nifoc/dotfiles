{
  den.aspects.onepassword = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ _1password-cli ];
      };
  };
}
