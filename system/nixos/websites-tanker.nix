{ pkgs, ... }:

let
  kempkens-io = pkgs.stdenvNoCC.mkDerivation {
    pname = "website-kempkens-io";
    version = "2023-09-18";

    src = pkgs.fetchFromGitea {
      domain = "git.kempkens.io";
      owner = "daniel";
      repo = "kempkens.io";
      rev = "3a6ca5be1709ce26772e9cf0e6a9ff7474712e40";
      hash = "sha256-gMjUH/baPWlRfdkt991H5qf1GcQTZWpJQwpKua0at9c=";
      fetchSubmodules = true;
    };

    nativeBuildInputs = with pkgs; [ brotli hugo ];

    installPhase = ''
      mkdir $out

      hugo

      find public -type f -regextype posix-extended -iregex '.*\.(css|js|json|html|txt|woff|woff2|xml)' \
        -exec gzip --best --keep {} ';'
      find public -type f -regextype posix-extended -iregex '.*\.(css|js|json|html|txt|woff|woff2|xml)' \
        -exec brotli --best --keep {} ';'

      mv public $out/
    '';
  };

  blog-kempkens-io = pkgs.stdenvNoCC.mkDerivation {
    pname = "website-blog-kempkens-io";
    version = "2023-09-18";

    src = pkgs.fetchFromGitea {
      domain = "git.kempkens.io";
      owner = "daniel";
      repo = "blog.kempkens.io";
      rev = "781c9479051ec7a096a36f51b96030b8cd49b165";
      hash = "sha256-H/To8dcbEbYklpZAr5mQxAjneNd7vPsNBhfeocJ9amo=";
      fetchSubmodules = true;
    };

    nativeBuildInputs = with pkgs; [ brotli hugo ];

    installPhase = ''
      mkdir $out

      hugo

      find public -type f -regextype posix-extended -iregex '.*\.(css|js|json|html|txt|woff|woff2|xml)' \
        -exec gzip --best --keep {} ';'
      find public -type f -regextype posix-extended -iregex '.*\.(css|js|json|html|txt|woff|woff2|xml)' \
        -exec brotli --best --keep {} ';'

      mv public $out/
    '';
  };

  docs-nifoc-pw = pkgs.stdenvNoCC.mkDerivation {
    pname = "website-docs-nifoc-pw";
    version = "2021-08-30";

    src = pkgs.fetchFromGitHub {
      owner = "nifoc";
      repo = "nifoc.pw-docs";
      rev = "24034da912e3d7fddc447734ca4c9a5951a0fa32";
      sha256 = "sha256-GwVwbLUbxpFidOU1CTHFbYs/MscHpsqiYmnyvLtnYjM=";
      fetchSubmodules = false;
    };

    nativeBuildInputs = with pkgs; [ brotli ];

    installPhase = ''
      mkdir $out

      find site -type f -regextype posix-extended -iregex '.*\.(css|js|json|html|txt|woff|woff2|xml)' \
        -exec gzip --best --keep {} ';'
      find site -type f -regextype posix-extended -iregex '.*\.(css|js|json|html|txt|woff|woff2|xml)' \
        -exec brotli --best --keep {} ';'

      mv site $out/
    '';
  };
in
{
  services.nginx = {
    virtualHosts = {
      # kempkens.io
      "kempkens.io" = {
        quic = true;
        http3 = true;
        kTLS = true;

        root = "${kempkens-io}/public";
        forceSSL = true;
        useACMEHost = "kempkens.io";

        extraConfig = ''
          add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
          add_header X-Frame-Options DENY;
          add_header X-XSS-Protection "1; mode=block";
          add_header X-Content-Type-Options nosniff;
          add_header Referrer-Policy no-referrer;
          add_header Content-Security-Policy "default-src 'none'; manifest-src https://kempkens.io; script-src 'self'; img-src 'self'; style-src 'self' 'unsafe-inline' https://cdnjs.cloudflare.com; font-src 'self'; form-action 'none'; frame-ancestors 'none'; base-uri 'self'";
        '';

        locations = {
          "/id".return = "307 https://keyoxide.org/028BCE9BABB5145AAAA1FB8410BE1D47E5ADFF92";
          "/.well-known/host-meta".return = "301 https://mastodon.kempkens.io/.well-known/host-meta";
          "/.well-known/webfinger".return = "301 https://mastodon.kempkens.io$request_uri";

          "/.well-known/matrix/server".extraConfig = ''
            default_type application/json;
          '';

          "/.well-known/matrix/client".extraConfig = ''
            default_type application/json;
          '';
        };
      };

      "www.kempkens.io" = {
        quic = true;
        http3 = true;

        addSSL = true;
        useACMEHost = "kempkens.io";

        extraConfig = ''
          add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
        '';

        globalRedirect = "kempkens.io";
      };

      # blog.kempkens.io
      "blog.kempkens.io" = {
        quic = true;
        http3 = true;
        kTLS = true;

        root = "${blog-kempkens-io}/public";
        forceSSL = true;
        useACMEHost = "kempkens.io";

        extraConfig = ''
          add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
          add_header X-Frame-Options DENY;
          add_header X-XSS-Protection "1; mode=block";
          add_header X-Content-Type-Options nosniff;
          add_header Referrer-Policy no-referrer;
          add_header Content-Security-Policy "default-src 'none'; manifest-src https://blog.kempkens.io; script-src 'self'; img-src 'self'; style-src 'self' 'unsafe-inline'; font-src 'self'; form-action 'none'; frame-ancestors 'none'; base-uri 'self'";
        '';
      };
    } // builtins.listToAttrs (builtins.map
      # Documentation
      (domain: {
        name = domain;
        value = {
          quic = true;
          http3 = true;
          kTLS = true;

          root = "${docs-nifoc-pw}/site/${domain}";
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
