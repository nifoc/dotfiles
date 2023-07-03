{ config, ... }:

let
  podman = config.virtualisation.podman.package;
  image = "ghcr.io/nanos/fedifetcher:latest";
in
{
  systemd.tmpfiles.rules = [
    "d /var/lib/fedifetcher 0744 root root"
  ];

  systemd.services.fedifetcher = {
    description = "FediFetcher";
    wants = [ "mastodon-web.service" ];
    after = [ "mastodon-web.service" ];
    # wantedBy = [ "multi-user.target" ];
    startAt = "*:0/25";

    serviceConfig =
      let
        data = "/var/lib/fedifetcher:/app/artifacts";
      in
      {
        Type = "oneshot";
        ExecStart = "${podman}/bin/podman run --name fedifetcher -v ${data} --rm ${image} --config=/app/artifacts/config.json";
      };
  };

  systemd.services.fedifetcher-updater = {
    description = "FediFetcher Updater";
    startAt = "daily";

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${podman}/bin/podman pull ${image}";
    };
  };
}
