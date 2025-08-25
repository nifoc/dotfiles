let
  domains = [
    "kempkens.io"
    "kempkens.email"
    "kempkens.li"
  ];

  hsts = {
    "kempkens.io" = "max-age=31536000; includeSubDomains; preload";
    "kempkens.email" = "max-age=31536000; includeSubDomains";
    "kempkens.li" = "max-age=31536000; includeSubDomains";
  };

  header-cleanup = ''
    header_down -Access
    header_down -Set-Cookie
    header_down -Content-Security-Policy
    header_down -Public-Key-Pins-Report-Only
    header_down -Strict-Transport-Security
    header_down -Expect-CT
  '';
in
{
  services.caddy.virtualHosts = builtins.listToAttrs (
    (builtins.map (domain: {
      name = "openpgpkey.${domain}";
      value = {
        extraConfig = ''
          encode

          header {
            >Strict-Transport-Security "${hsts."${domain}"}"
            >Access-Control-Allow-Origin "*"
          }

          handle /.well-known/openpgpkey/${domain}/* {
            reverse_proxy https://api.protonmail.ch {
              header_up Host {upstream_hostport}
              ${header-cleanup}
            }
          }

          handle {
            respond "I'm a teapot" 418
          }
        '';
      };
    }) domains)
    ++ (builtins.map (domain: {
      name = "mta-sts.${domain}";
      value = {
        extraConfig = ''
          encode

          header >Strict-Transport-Security "${hsts."${domain}"}"

          handle /.well-known/mta-sts.txt {
            reverse_proxy https://mta-sts.protonmail.com {
              header_up Host {upstream_hostport}
              ${header-cleanup}
            }
          }

          handle {
            respond "I'm a teapot" 418
          }
        '';
      };
    }) domains)
  );
}
