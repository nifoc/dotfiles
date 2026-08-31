{
  den.aspects.hister = {
    nixos = {
      services.caddy.virtualHosts."hister.internal.kempkens.network" = {
        extraConfig = ''
          encode

          reverse_proxy 192.168.42.2:4433
        '';
      };
    };
  };
}
