{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;

    # Documentation
    virtualHosts = builtins.listToAttrs (builtins.map
      (domain: {
        name = domain;
        value = {
          listen = [
            {
              addr = "127.0.0.1";
              port = 80;
            }
          ];

          root = "${pkgs.website-docs-nifoc-pw}/site/${domain}";

          extraConfig = ''
            autoindex on;
            autoindex_format html;
          '';
        };
      }) [ "katja.nifoc.pw" "katja_vmstats.nifoc.pw" "noesis.nifoc.pw" "propagator.nifoc.pw" ]);
  };
}
