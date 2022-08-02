{
  systemd.tmpfiles.rules = [
    "d /etc/container-adsb 0755 root root"

    "d /etc/container-adsb/readsb 0755 1000 1000"
    "d /etc/container-adsb/readsb/autogain 0755 1000 1000"

    "d /etc/container-adsb/tar1090 0755 1000 1000"
    "d /etc/container-adsb/tar1090/heatmap 0755 1000 1000"
  ];
}
