{ secret, ... }:

{
  systemd.tmpfiles.rules = [
    "d /etc/container-webserver/weewx 0755 421 421"
    "d /etc/container-webserver/weewx/html 0755 421 421"
    "d /etc/container-matrix/synapse 0755 991 991"
    "d /etc/container-matrix/telegram 0775 1337 1337"
    "d /etc/container-matrix/signald 0775 0 0"
    "d /etc/container-matrix/signal 0775 1337 1337"
    "d /etc/container-matrix/whatsapp 0775 1337 1337"
  ];

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

  # weewx

  environment.etc."container-webserver/weewx/weewx.conf" = {
    source = ../../secret/container/webserver/config/weewx.conf;
    mode = "0644";
    uid = 421;
    gid = 421;
  };

  # Matrix: Synapse

  environment.etc."container-matrix/synapse/homeserver.yaml" = {
    source = ../../secret/container/webserver/config/matrix/homeserver.yaml;
    mode = "0640";
    uid = 991;
    gid = 991;
  };

  # Matrix: Telegram

  environment.etc."container-matrix/telegram/config.yaml" = {
    source = ../../secret/container/webserver/config/matrix/telegram.yaml;
    mode = "0640";
    uid = 1337;
    gid = 1337;
  };

  # Matrix: Signal

  environment.etc."container-matrix/signal/config.yaml" = {
    source = ../../secret/container/webserver/config/matrix/signal.yaml;
    mode = "0640";
    uid = 1337;
    gid = 1337;
  };

  # Matrix: WhatsApp

  environment.etc."container-matrix/whatsapp/config.yaml" = {
    source = ../../secret/container/webserver/config/matrix/whatsapp.yaml;
    mode = "0640";
    uid = 1337;
    gid = 1337;
  };
}
