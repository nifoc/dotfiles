{ config, secret, ... }:

{
  systemd.services.fedifetcher = {
    description = "FediFetcher";
    after = [ "mastodon-web.service" "mastodon-sidekiq.service" ];
    wantedBy = [ "multi-user.target" ];
    startAt = "*:0/25";

    serviceConfig =
      let
        podman = config.virtualisation.podman.package;
        image = "ghcr.io/nanos/fedifetcher:latest";
        data = "/var/lib/fedifetcher:/app/artifacts";
        token = secret.mastodon.fedifetcher.accessToken;
        server = "mastodon.kempkens.io";
      in
      {
        Type = "oneshot";
        ExecStart = "${podman}/bin/podman run --name fedifetcher -v ${data} --rm ${image} --access-token=${token} --server=${server} --home-timeline-length=50 --max-followings=5 --from-notifications=1";
      };
  };
}
