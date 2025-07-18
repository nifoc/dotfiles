{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "acme@kempkens.io";
      group = "caddy";
      dnsProvider = "cloudflare";
      credentialsFile = config.age.secrets.acme-credentials.path;
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
      reloadServices = [ "caddy.service" ];
    };

    certs = {
      "kempkens.io" = {
        extraDomainNames = [ "*.kempkens.io" ];
      };
    };
  };
}
