{ pkgs, lib, ... }:

let
  inherit (pkgs) stdenv;

  attic = pkgs.attic-client.overrideAttrs (_: _: {
    env = lib.optionalAttrs stdenv.cc.isClang {
      NIX_LDFLAGS = "-l${stdenv.cc.libcxx.cxxabi.libName}";
    };
  });
in
{
  environment.systemPackages = [ attic ];
}
