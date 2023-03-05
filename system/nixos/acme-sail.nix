{ config, ... }:

{
  security.acme = {
    acceptTerms = true;
    email = "acme@kempkens.io";

    defaults = {
      dnsProvider = "cloudflare";
      credentialsFile = config.age.secrets.acme-credentials.path;
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
    };

    certs = {
      "daniel.sx" = {
        domain = "*.daniel.sx";
      };
    };
  };
}
