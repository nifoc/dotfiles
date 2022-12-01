{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.website-docs-nifoc-pw ];

  services.nginx = {
    enable = true;

    # Documentation
    virtualHosts = builtins.listToAttrs (builtins.map
      (domain: {
        name = domain;
        value = {
          root = "${pkgs.website-docs-nifoc-pw}/site/${domain}";
          extraConfig = ''
            autoindex on;
            autoindex_format html;
          '';
        };
      }) [ "katja.nifoc.pw" ]);
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
