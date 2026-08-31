{ den, ... }:

{
  den.aspects.bitwarden.provides.macos = {
    includes = with den.aspects; [
      bitwarden
    ];
  };
}
