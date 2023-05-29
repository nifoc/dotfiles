{ config, secret, ... }:

{
  systemd.services.fedifetcher = {
    wants = [ "mastodon-web.service" "mastodon-sidekiq.service" ];
    after = [ "mastodon-web.service" "mastodon-sidekiq.service" ];
    wantedBy = [ "default.target" ];

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
        ExecStart = "${podman}/bin/podman run -v ${data} --rm ${image} --access-token=${token} --server=${server} --home-timeline-length=50 --max-followings=5 --from-notifications=1";
      };
  };

  systemd.timers.fedifetcher = {
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnUnitInactiveSec = "15minutes";
      RandomizedDelaySec = 30;
      Persistent = true;
    };
  };
}
