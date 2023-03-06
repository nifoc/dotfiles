{ config, secret, ... }:

{
  services.freshrss = {
    enable = true;

    inherit (secret.freshrss) defaultUser;
    passwordFile = config.age.secrets.freshrss-user-password.path;

    inherit (secret.freshrss) baseUrl;
    virtualHost = null; # Disable auto-generated nginx entry

    database = {
      type = "pgsql";
      host = "10.99.99.3";
      port = 5432;
      user = "freshrss";
      passFile = config.age.secrets.freshrss-database-password.path;
    };
  };

  # Based on: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/web-apps/freshrss.nix
  services.nginx.virtualHosts."${secret.freshrss.virtualHost}" = {
    http3 = true;

    root = "${config.services.freshrss.package}/p";
    forceSSL = true;
    useACMEHost = "kempkens.io";

    # php files handling
    # this regex is mandatory because of the API
    locations."~ ^.+?\.php(/.*)?$".extraConfig = ''
      fastcgi_pass unix:${config.services.phpfpm.pools.${config.services.freshrss.pool}.socket};
      fastcgi_split_path_info ^(.+\.php)(/.*)$;
      # By default, the variable PATH_INFO is not set under PHP-FPM
      # But FreshRSS API greader.php need it. If you have a “Bad Request” error, double check this var!
      # NOTE: the separate $path_info variable is required. For more details, see:
      # https://trac.nginx.org/nginx/ticket/321
      set $path_info $fastcgi_path_info;
      fastcgi_param PATH_INFO $path_info;
      include ${config.services.nginx.package}/conf/fastcgi_params;
      include ${config.services.nginx.package}/conf/fastcgi.conf;
    '';

    locations."/" = {
      tryFiles = "$uri $uri/ index.php";
      index = "index.php index.html index.htm";
    };
  };
}
