{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "acme@kempkens.io";
      group = "nginx";
      dnsProvider = "cloudflare";
      credentialsFile = config.age.secrets.acme-credentials.path;
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
      reloadServices = [ "nginx.service" ];
    };

    certs = {
      "internal.kempkens.network" = {
        domain = "*.internal.kempkens.network";
      };
    };
  };
}
