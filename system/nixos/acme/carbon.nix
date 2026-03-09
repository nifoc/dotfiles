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
      "burning.computer" = {
        extraDomainNames = [ "*.burning.computer" ];
        group = "caddy";

        postRun = ''
          # prosody
          cp key.pem /var/lib/prosody/xmpp-key.pem
          chown prosody:prosody /var/lib/prosody/xmpp-key.pem
          cp fullchain.pem /var/lib/prosody/xmpp-fullchain.pem
          chown prosody:prosody /var/lib/prosody/xmpp-fullchain.pem
          systemctl reload prosody

          # coturn
          cp key.pem /var/lib/coturn/key.pem
          chown turnserver:turnserver /var/lib/coturn/key.pem
          cp fullchain.pem /var/lib/coturn/fullchain.pem
          chown turnserver:turnserver /var/lib/coturn/fullchain.pem
          systemctl reload coturn
        '';
      };
    };
  };
}
