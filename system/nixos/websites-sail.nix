{ pkgs, ... }:

{
  services.nginx = {
    # Documentation
    virtualHosts = builtins.listToAttrs (builtins.map
      (domain: {
        name = domain;
        value = {
          http3 = true;

          root = "${pkgs.website-docs-nifoc-pw}/site/${domain}";
          forceSSL = true;
          useACMEHost = "nifoc.pw";

          extraConfig = ''
            autoindex on;
            autoindex_format html;
          '';
        };
      }) [ "katja.nifoc.pw" "katja_vmstats.nifoc.pw" "noesis.nifoc.pw" "propagator.nifoc.pw" ]);
  };
}
