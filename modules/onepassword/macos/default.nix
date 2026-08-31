{ den, ... }:

{
  den.aspects.onepassword.provides.macos = {
    includes = with den.aspects; [
      onepassword
    ];
  };
}
