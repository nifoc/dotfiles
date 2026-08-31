{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.geoip-updater = {
    nixos =
      { config, lib, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          geoip-updater-license = {
            file = lib.mkForce ../../agenix/geoip-updater/license.age;
          };
        };

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

              LicenseKey = config.age.secrets.geoip-updater-license.path;
            };
          };

          caddy.extraConfig = ''
            (geoblock-common) {
              @geoblock {
                maxmind_geolocation {
                  db_path "${config.services.geoipupdate.settings.DatabaseDirectory}/GeoLite2-Country.mmdb"
                  allow_countries RU CN US NG RO KP UNK
                }
              }

              respond @geoblock "Access Denied" 403 {
                close
              }
            }
          '';
        };
      };
  };
}
