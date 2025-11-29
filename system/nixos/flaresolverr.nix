let
  internalIP = "192.168.42.2";
  internalPort = "8191";
  netns = "dl";
in
{
  virtualisation.quadlet.containers.flaresolverr = {
    containerConfig = {
      image = "ghcr.io/flaresolverr/flaresolverr:latest";
      environments = {
        "TZ" = "Etc/UTC";
        "HOST" = internalIP;
        "PORT" = internalPort;
      };
      networks = [ "ns:/var/run/netns/${netns}" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
    };

    unitConfig = {
      BindsTo = [ "wg-${netns}.service" ];
      After = [ "wg-${netns}.service" ];
    };
  };
}
