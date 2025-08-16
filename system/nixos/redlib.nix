{ config, lib, ... }:

let
  cfg = config.services.redlib;
  netns = "dl";
in
{
  services = {
    redlib = {
      enable = true;
      address = "192.168.42.2";
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

  systemd.services.redlib = {
    bindsTo = [ "wg-${netns}.service" ];
    after = lib.mkAfter [ "wg-${netns}.service" ];

    serviceConfig = {
      NetworkNamespacePath = "/var/run/netns/${netns}";
      BindReadOnlyPaths = [
        "/etc/netns/${netns}/resolv.conf:/etc/resolv.conf:norbind"
        "/etc/netns/${netns}/nsswitch.conf:/etc/nsswitch.conf:norbind"
        "/etc/netns/${netns}/nscd-kill:/run/nscd:norbind"
      ];
    };
  };
}
