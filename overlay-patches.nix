self: super: {
  fennel-luajit = super.fennel.overrideAttrs (
    let
      luaPackages = with super.luajitPackages; [ readline ];
    in
    o: rec {
      buildInputs = [ super.luajit super.makeWrapper ] ++ luaPackages;

      postInstall = o.postInstall or "" + ''
        wrapProgram $out/bin/fennel \
          --suffix LUA_CPATH ";" "${super.lib.concatMapStringsSep ";" super.luajitPackages.getLuaCPath luaPackages}" \
          --suffix LUA_PATH ";" "${super.lib.concatMapStringsSep ";" super.luajitPackages.getLuaPath luaPackages}"
      '';
    }
  );
}
