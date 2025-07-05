{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "acme@kempkens.io";
      group = "caddy";
      dnsProvider = "cloudflare";
      environmentFile = config.age.secrets.acme-credentials.path;
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
      reloadServices = [ "caddy.service" ];
    };

    certs = {
      "kempkens.io" = {
        extraDomainNames = [ "*.kempkens.io" ];
      };

      "kempkens.network" = {
        extraDomainNames = [ "*.kempkens.network" ];

        dnsProvider = "ovh";
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
