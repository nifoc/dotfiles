{
  flake-file.inputs = {
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  perSystem =
    { inputs', ... }:
    {
      packages = {
        deploy-rs = inputs'.deploy-rs.packages.default;
      };
    };
}
