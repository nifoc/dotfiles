{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.xmpp-server = {
    nixos =
      { config, ... }:
      let
        xmppCfg = den.aspects.${config.networking.hostName}.meta.xmpp-server;

        inherit (xmppCfg) domain;
      in
      {
        imports = [
          inputs.agenix.nixosModules.default
        ];

        age.secrets = {
          xmpp-server-acme-credentials = {
            file = ../../agenix/xmpp-server/acme/credentials.age;
            owner = "acme";
            group = "acme";
          };
        };

        security.acme = {
          acceptTerms = true;

          defaults = {
            email = "acme@kempkens.io";
            dnsProvider = "desec";
            environmentFile = config.age.secrets.xmpp-server-acme-credentials.path;
            dnsResolver = "ns1.desec.io:53";
            dnsPropagationCheck = true;
          };

          certs = {
            "${domain}" = {
              extraDomainNames = [ "*.${domain}" ];
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
      };
  };
}
