{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "acme@kempkens.io";
      dnsProvider = "desec";
      environmentFile = config.age.secrets.acme-credentials.path;
      dnsResolver = "ns1.desec.io:53";
      dnsPropagationCheck = true;
    };

    certs = {
      "xmpp.kempkens.network" = {
        extraDomainNames = [ "*.xmpp.kempkens.network" ];
        group = "caddy";

        postRun = ''
          # Prosody
          cp key.pem /var/lib/prosody/xmpp-key.pem
          chown prosody:prosody /var/lib/prosody/xmpp-key.pem
          cp fullchain.pem /var/lib/prosody/xmpp-fullchain.pem
          chown prosody:prosody /var/lib/prosody/xmpp-fullchain.pem
          systemctl reload prosody
        '';
      };
    };
  };
}
