{
  den.aspects.nix-cache = {
    nixos =
      { config, ... }:
      {
        services.caddy.virtualHosts."${builtins.elemAt config.services.atticd.settings.allowed-hosts 0}" = {
          extraConfig = ''
            request_body {
              max_size 2GB
            }

            reverse_proxy ${config.services.atticd.settings.listen} {
              flush_interval -1
            }
          '';
        };
      };
  };
}
