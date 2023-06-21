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
      "kempkens.io" = {
        domain = "*.kempkens.io";
      };

      "daniel.sx" = {
        domain = "*.daniel.sx";
        extraDomainNames = [ "*.cache.daniel.sx" ];
      };

      "nifoc.pw" = {
        domain = "*.nifoc.pw";
      };
    };
  };
}
