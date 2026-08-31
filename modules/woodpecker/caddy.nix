{
  den.aspects.woodpecker = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.woodpecker-server.environment;
      in
      {
        services.caddy.virtualHosts = {
          "${builtins.replaceStrings [ "https://" ] [ "" ] cfg.WOODPECKER_HOST}" = {
            extraConfig = ''
              encode

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              reverse_proxy ${cfg.WOODPECKER_SERVER_ADDR}
            '';
          };

          "${builtins.replaceStrings [ "https://ci" ] [ "ci-grpc" ] cfg.WOODPECKER_HOST}" = {
            extraConfig = ''
              encode

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              reverse_proxy h2c://${cfg.WOODPECKER_GRPC_ADDR}
            '';
          };
        };
      };
  };
}
