{ den, ... }:

{
  den.aspects.weewx = {
    nixos =
      { config, ... }:
      let
        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;
      in
      {
        services.caddy.virtualHosts."http://wetter.kempkens.io:7781" = {
          listenAddresses = [
            networkConfig.tailscale.ipv4
            "[${networkConfig.tailscale.ipv6}]"
          ];

          extraConfig = ''
            encode

            @html {
              file
              path *.html
            }

            @js_css {
              file
              path *.js *.css
            }

            header @html Cache-Control "public, max-age=60, immutable"
            header @js_css Cache-Control "public, max-age=600"

            root * ${config.users.users.weewx.home}/data/html/wdc
            reverse_proxy /mqtt 127.0.0.1:9883
            file_server
          '';
        };

        networking.firewall.interfaces."${networkConfig.tailscale.name}".allowedTCPPorts = [ 7781 ];
      };
  };
}
