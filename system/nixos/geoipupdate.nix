{ config, ... }:

{
  services = {
    geoipupdate = {
      enable = true;

      settings = {
        AccountID = 1204249;

        EditionIDs = [
          "GeoLite2-ASN"
          "GeoLite2-City"
          "GeoLite2-Country"
        ];

        LicenseKey = config.age.secrets.geoipupdate-license.path;
      };
    };

    caddy.extraConfig = ''
      (geoblock-common) {
        @geoblock {
          maxmind_geolocation {
            db_path "${config.services.geoipupdate.settings.DatabaseDirectory}/GeoLite2-Country.mmdb"
            allow_countries RU CN NG RO KP UNK
          }
        }

        respond @geoblock "Access Denied" 403 {
          close
        }
      }
    '';
  };
}
