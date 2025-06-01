{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "acme@kempkens.io";
      group = "nginx";
      dnsProvider = "cloudflare";
      environmentFile = config.age.secrets.acme-credentials.path;
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
      reloadServices = [ "nginx.service" ];
    };

    certs = {
      "kempkens.io" = {
        extraDomainNames = [ "*.kempkens.io" ];
      };

      "kempkens.network" = {
        extraDomainNames = [ "*.kempkens.network" ];
      };

      "networked.systems" = {
        extraDomainNames = [ "*.networked.systems" ];
      };

      "nifoc.pw" = {
        domain = "*.nifoc.pw";

        dnsProvider = "ovh";
      };
    };
  };
}
