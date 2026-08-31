{
  den.aspects.jellyfin = {
    nixos = {
      services.caddy.virtualHosts = {
        "jellyfin.internal.kempkens.network:9920" = {

          extraConfig = ''
            encode

            header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

            reverse_proxy 127.0.0.1:8096 {
              flush_interval -1
            }
          '';
        };
      };
    };
  };
}
