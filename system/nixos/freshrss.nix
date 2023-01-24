{ config, secret, ... }:

{
  services.freshrss = {
    enable = true;

    inherit (secret.freshrss) defaultUser;
    inherit (secret.freshrss) passwordFile;

    inherit (secret.freshrss) baseUrl;
    inherit (secret.freshrss) virtualHost;

    database = {
      type = "pgsql";
      host = "10.99.99.3";
      port = 5432;
      inherit (secret.freshrss.database) user;
      inherit (secret.freshrss.database) passFile;
    };
  };
}
