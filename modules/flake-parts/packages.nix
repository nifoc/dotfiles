{
  flake-file.inputs = {
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  perSystem =
    { pkgs, inputs', ... }:
    {
      packages = {
        deploy-rs = inputs'.deploy-rs.packages.default;
        lix = pkgs.lixPackageSets.latest.lix;
      };
    };
}
