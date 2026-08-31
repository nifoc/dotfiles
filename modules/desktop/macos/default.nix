{ den, ... }:

{
  den.aspects.desktop.provides.macos = {
    includes = with den.aspects; [
      desktop
    ];
  };
}
