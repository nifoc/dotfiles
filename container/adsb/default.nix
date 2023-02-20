let
  secret = import ../../secret/container/adsb;
  custom-config = import ./config.nix;
in
{
  virtualisation.arion.projects.adsb.settings = {
    services = {
      readsb = {
        service = {
          image = "ghcr.io/sdr-enthusiasts/docker-readsb-protobuf:latest";
          container_name = "readsb";
          hostname = "readsb";
          restart = "unless-stopped";
          environment = {
            "TZ" = "Europe/Berlin";
            "DISABLE_PERFORMANCE_GRAPHS" = "true";
            "DISABLE_WEBAPP" = "true";
            "READSB_NET_ENABLE" = "true";
            "READSB_DCFILTER" = "true";
            "READSB_FIX" = "true";
            "READSB_GAIN" = "autogain";
            "READSB_LAT" = secret.container.adsb.readsb.lat;
            "READSB_LON" = secret.container.adsb.readsb.lon;
            "READSB_MODEAC" = "true";
            "READSB_RX_LOCATION_ACCURACY" = "2";
          };
          devices = [ "/dev/bus/usb:/dev/bus/usb" ];
          volumes = [
            "/etc/container-adsb/readsb/autogain:/run/autogain"
          ];
          tmpfs = [
            "/run:exec,size=64M"
            "/var/log:size=32M"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      mlathub = {
        service = {
          image = "ghcr.io/sdr-enthusiasts/docker-readsb-protobuf:latest";
          container_name = "mlathub";
          hostname = "mlathub";
          restart = "unless-stopped";
          depends_on = [ "readsb" "piaware" ];
          environment = {
            "TZ" = "Europe/Berlin";
            "DISABLE_PERFORMANCE_GRAPHS" = "true";
            "DISABLE_WEBAPP" = "true";
            "READSB_NET_ENABLE" = "true";
            "READSB_NET_ONLY" = "true";
            "READSB_FORWARD_MLAT" = "true";
            "READSB_NET_CONNECTOR" = "piaware,30105,beast_in";
            "READSB_NET_BEAST_OUTPUT_PORT" = "30105";
          };
          tmpfs = [
            "/run:exec,size=64M"
            "/var/log:size=32M"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      tar1090 = {
        service = {
          image = "ghcr.io/sdr-enthusiasts/docker-tar1090:latest";
          container_name = "tar1090";
          restart = "unless-stopped";
          depends_on = [ "readsb" "mlathub" ];
          ports = [ "8081:80" ];
          environment = {
            "TZ" = "Europe/Berlin";
            "BEASTHOST" = "readsb";
            "BEASTPORT" = "30005";
            "MLATHOST" = "mlathub";
            "MLATPORT" = "30105";
            "LAT" = secret.container.adsb.readsb.lat;
            "LONG" = secret.container.adsb.readsb.lon;
            "HEYWHATSTHAT_PANORAMA_ID" = secret.container.adsb.tar1090.heywhatsthatId;
            "TAR1090_FLIGHTAWARELINKS" = "true";
            "TAR1090_DISPLAYUNITS" = "metric";
          };
          volumes = [
            "/etc/container-adsb/tar1090/heatmap:/var/globe_history"
          ];
          tmpfs = [
            "/run:exec,size=64M"
            "/var/log"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      fr24feed = {
        service = {
          image = "ghcr.io/sdr-enthusiasts/docker-flightradar24:latest";
          container_name = "fr24feed";
          restart = "unless-stopped";
          depends_on = [ "readsb" ];
          environment = {
            "TZ" = "Europe/Berlin";
            "BEASTHOST" = "readsb";
            "BEASTPORT" = "30005";
            "MLAT" = "yes";
            "FR24KEY" = secret.container.adsb.fr24feed.key;
          };
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      piaware = {
        service = {
          image = "ghcr.io/sdr-enthusiasts/docker-piaware:latest";
          container_name = "piaware";
          restart = "unless-stopped";
          depends_on = [ "readsb" ];
          environment = {
            "TZ" = "Europe/Berlin";
            "RECEIVER_TYPE" = "relay";
            "BEASTHOST" = "readsb";
            "BEASTPORT" = "30005";
            "ALLOW_MLAT" = "yes";
            "MLAT_RESULTS" = "yes";
            "LAT" = secret.container.adsb.readsb.lat;
            "LONG" = secret.container.adsb.readsb.lon;
            "FEEDER_ID" = secret.container.adsb.piaware.feederId;
          };
          tmpfs = [
            "/run:exec,size=64M"
            "/var/log"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };
    };
  };
} // custom-config
