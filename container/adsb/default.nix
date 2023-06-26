let
  secret = import ../../secret/container/adsb;
in
{
  virtualisation.oci-containers.containers = {
    readsb = {
      image = "ghcr.io/sdr-enthusiasts/docker-readsb-protobuf:latest";
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
      volumes = [
        "/etc/container-adsb/readsb/autogain:/run/autogain"
      ];
      extraOptions = [
        "--device=/dev/bus/usb:/dev/bus/usb"
        "--tmpfs=/run:exec,size=64M"
        "--tmpfs=/var/log:size=32M"
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };

    mlathub = {
      image = "ghcr.io/sdr-enthusiasts/docker-readsb-protobuf:latest";
      # dependsOn = [ "readsb" "piaware" ];
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
      extraOptions = [
        "--tmpfs=/run:exec,size=64M"
        "--tmpfs=/var/log:size=32M"
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };

    tar1090 = {
      image = "ghcr.io/sdr-enthusiasts/docker-tar1090:latest";
      # dependsOn = [ "readsb" "mlathub" ];
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
      extraOptions = [
        "--tmpfs=/run:exec,size=64M"
        "--tmpfs=/var/log"
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };

    fr24feed = {
      image = "ghcr.io/sdr-enthusiasts/docker-flightradar24:latest";
      # dependsOn = [ "readsb" ];
      environment = {
        "TZ" = "Europe/Berlin";
        "BEASTHOST" = "readsb";
        "BEASTPORT" = "30005";
        "MLAT" = "yes";
        "FR24KEY" = secret.container.adsb.fr24feed.key;
      };
      extraOptions = [
        "--tmpfs=/run:exec,size=64M"
        "--tmpfs=/var/log"
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };

    piaware = {
      image = "ghcr.io/sdr-enthusiasts/docker-piaware:latest";
      # dependsOn = [ "readsb" ];
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
      extraOptions = [
        "--tmpfs=/run:exec,size=64M"
        "--tmpfs=/var/log"
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /etc/container-adsb 0755 root root"

    "d /etc/container-adsb/readsb 0755 1000 1000"
    "d /etc/container-adsb/readsb/autogain 0755 1000 1000"

    "d /etc/container-adsb/tar1090 0755 1000 1000"
    "d /etc/container-adsb/tar1090/heatmap 0755 1000 1000"
  ];
}
