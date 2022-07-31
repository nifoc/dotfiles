{ secret, ... }:

{
  # mosquitto

  environment.etc."container-webserver/mosquitto/mosquitto.conf" = {
    text = ''
      listener 1883
      password_file /mosquitto/config/users.conf
    '';

    mode = "0644";
  };

  environment.etc."container-webserver/mosquitto/users.conf" = {
    text = secret.container.webserver.mosquitto.users;
    mode = "0644";
  };

  # traefik

  environment.etc."container-webserver/traefik/traefik.toml" = {
    text = ''
      [providers]
        [providers.file]
          directory = "/custom_config"
          watch = true

        [providers.docker]
          exposedByDefault = false

      [entryPoints]
        [entryPoints.web]
          address = ":80"

        [entryPoints.websecure]
          address = ":443"

      [certificatesResolvers.cfresolver.acme]
        email = "${secret.container.webserver.traefik.config.acme.email}"
        storage = "/acme.json"
        keyType = "EC384"

        [certificatesResolvers.cfresolver.acme.dnsChallenge]
          provider = "cloudflare"

      [api]
        dashboard = true
    '';

    mode = "0644";
  };

  environment.etc."container-webserver/traefik/custom/middlewares.toml" = {
    text = ''
      [http.middlewares]
        [http.middlewares.non-www-redirect.redirectRegex]
          regex = "^https://www.(.*)"
          replacement = "https://''${1}"
          permanent = true

        [http.middlewares.https-redirect.redirectScheme]
          scheme = "https"
          permanent = true

        [http.middlewares.content-compression.compress]

        [http.middlewares.very-low-request-rate.rateLimit]
          average = 3
          period = "1m"

        [http.middlewares.security-headers.headers]
          frameDeny = true
          browserXssFilter = true
          contentTypeNosniff = true
          referrerPolicy = "no-referrer"
          contentSecurityPolicy = "default-src 'none'; script-src 'self'; img-src 'self'; style-src 'self' 'unsafe-inline' https://cdnjs.cloudflare.com; font-src 'self'; form-action 'none'; frame-ancestors 'none'; base-uri 'self'"
    '';

    mode = "0644";
  };
}
