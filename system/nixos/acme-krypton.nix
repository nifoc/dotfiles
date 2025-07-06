{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "acme@kempkens.io";
      group = "caddy";
      dnsProvider = "ovh";
      credentialsFile = config.age.secrets.acme-credentials.path;
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
      reloadServices = [ "caddy.service" ];
    };

    certs = {
      "internal.kempkens.network" = {
        domain = "*.internal.kempkens.network";
        #extraDomainNames = [ "jellyfin.home.kempkens.io" ];
      };
    };
  };
}
