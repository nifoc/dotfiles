let
  user-daniel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1UfCIu7jUe64iQmp2UUyAgqZ3IYdMOo/Me6hRTnKoG";

  system-tanker = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILpnogLd3Ttmz/At0dXveaG1xF37vV7lz34ojDTIuCOi";
  system-mediaserver = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDlB0cL5CtTOyARWSE2yUsNU4JHUPmr71710mZHzsmbX";
  system-argon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPP9ygczyi6g8abvj1I0eAj7N2Rli9UMlkC8VT6SnWLU";
  system-weather-sdr = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBHuAdx5u9R2DyK065DUxdwhEOi0at1WNkY5f4JtrOzk";

  tanker = [ user-daniel system-tanker ];
  mediaserver = [ user-daniel system-mediaserver ];
  argon = [ user-daniel system-argon ];
  weather-sdr = [ user-daniel system-weather-sdr ];
in
{
  # tanker
  "agenix/hosts/tanker/user/danielPassword.age".publicKeys = tanker;

  "agenix/hosts/tanker/acme/credentials.age".publicKeys = tanker;

  "agenix/hosts/tanker/tailscale/authkey.age".publicKeys = tanker;

  "agenix/hosts/tanker/msmtp/password.age".publicKeys = tanker;

  "agenix/hosts/tanker/atticd/environment.age".publicKeys = tanker;

  "agenix/hosts/tanker/fedifetcher/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/mastodon/databasePassword.age".publicKeys = tanker;
  "agenix/hosts/tanker/mastodon/smtpPassword.age".publicKeys = tanker;
  "agenix/hosts/tanker/mastodon/otpSecret.age".publicKeys = tanker;
  "agenix/hosts/tanker/mastodon/secretKeyBase.age".publicKeys = tanker;
  "agenix/hosts/tanker/mastodon/vapidPrivateKey.age".publicKeys = tanker;
  "agenix/hosts/tanker/mastodon/vapidPublicKey.age".publicKeys = tanker;
  "agenix/hosts/tanker/mastodon/extraConfig.age".publicKeys = tanker;

  "agenix/hosts/tanker/miniflux/credentials.age".publicKeys = tanker;

  "agenix/hosts/tanker/mosquitto/passwordWeewxProxy.age".publicKeys = tanker;
  "agenix/hosts/tanker/mosquitto/passwordWeewx.age".publicKeys = tanker;

  "agenix/hosts/tanker/nitter/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/anonymous-overflow/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/invidious/databasePassword.age".publicKeys = tanker;
  "agenix/hosts/tanker/invidious/extraSettings.age".publicKeys = tanker;

  "agenix/hosts/tanker/linkding/environment.age".publicKeys = tanker;

  "agenix/hosts/tanker/proxitok/environment.age".publicKeys = tanker;

  "agenix/hosts/tanker/synapse/extraConfig.age".publicKeys = tanker;
  "agenix/hosts/tanker/synapse/slidingSyncConfig.age".publicKeys = tanker;

  "agenix/hosts/tanker/mautrix-signal/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/signald/environment.age".publicKeys = tanker;

  "agenix/hosts/tanker/mautrix-whatsapp/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/weewx/config.age".publicKeys = tanker;
  "agenix/hosts/tanker/weewx/skin.age".publicKeys = tanker;

  # mediaserver
  "agenix/hosts/mediaserver/user/danielPassword.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/acme/credentials.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tailscale/authkey.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/wireguard/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentTA.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentES.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/aria2/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/unpackerr/config.age".publicKeys = mediaserver;

  # argon
  "agenix/hosts/argon/user/danielPassword.age".publicKeys = argon;

  "agenix/hosts/argon/acme/credentials.age".publicKeys = argon;

  "agenix/hosts/argon/tailscale/authkey.age".publicKeys = argon;

  "agenix/hosts/argon/adguardhome-sync/environment.age".publicKeys = argon;

  "agenix/hosts/argon/weewx-proxy/environment.age".publicKeys = argon;

  # weather-sdr
  "agenix/hosts/weather-sdr/user/danielPassword.age".publicKeys = weather-sdr;

  "agenix/hosts/weather-sdr/mosquitto/passwordWeewxProxy.age".publicKeys = weather-sdr;
}
