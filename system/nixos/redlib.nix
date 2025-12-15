{ config, ... }:

let
  cfg = config.services.redlib;
in
{
  services = {
    redlib = {
      enable = true;
      address = "127.0.0.1";
      port = 8002;

      settings = {
        REDLIB_DEFAULT_LAYOUT = "compact";
        REDLIB_DEFAULT_WIDE = "on";
        REDLIB_DEFAULT_SHOW_NSFW = "on";
        REDLIB_DEFAULT_USE_HLS = "on";
      };
    };

    caddy.virtualHosts."reddit.internal.kempkens.network" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${cfg.address}:${toString cfg.port}
      '';
    };
  };
}
