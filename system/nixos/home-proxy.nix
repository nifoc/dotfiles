{
  services.caddy = {
    virtualHosts."wetter.kempkens.io" = {
      useACMEHost = "kempkens.io";

      extraConfig = ''
        encode

        header {
          Permissions-Policy interest-cohort=()
          >Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
          X-Content-Type-Options nosniff
          X-Frame-Options DENY
          X-XSS-Protection "1; mode=block"
        }

        import robots-txt-generic

        handle /mqtt {
          reverse_proxy http://100.88.88.45:${toString (7780 + 1)}
        }

        handle {
          reverse_proxy h2c://100.88.88.45:${toString (7780 + 1)}
        }
      '';
    };
  };
}
