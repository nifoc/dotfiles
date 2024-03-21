let
  user-daniel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1UfCIu7jUe64iQmp2UUyAgqZ3IYdMOo/Me6hRTnKoG";

  system-tanker = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILpnogLd3Ttmz/At0dXveaG1xF37vV7lz34ojDTIuCOi";
  system-mediaserver = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDlB0cL5CtTOyARWSE2yUsNU4JHUPmr71710mZHzsmbX";
  system-argon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPP9ygczyi6g8abvj1I0eAj7N2Rli9UMlkC8VT6SnWLU";
  system-neon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA5Ht4KaRUvuGFmYLznTkVSnn6isjrcVplz1kKWkrnRQ";

  tanker = [ user-daniel system-tanker ];
  mediaserver = [ user-daniel system-mediaserver ];
  argon = [ user-daniel system-argon ];
  neon = [ user-daniel system-neon ];
  all-systems = [ user-daniel system-tanker system-mediaserver system-argon system-neon ];
in
{
  # all
  "agenix/hosts/all/nix/netrc.age".publicKeys = all-systems;

  # tanker
  "agenix/hosts/tanker/user/danielPassword.age".publicKeys = tanker;

  "agenix/hosts/tanker/acme/credentials.age".publicKeys = tanker;

  "agenix/hosts/tanker/tailscale/authkey.age".publicKeys = tanker;

  "agenix/hosts/tanker/msmtp/password.age".publicKeys = tanker;

  "agenix/hosts/tanker/atticd/environment.age".publicKeys = tanker;

  "agenix/hosts/tanker/fedifetcher/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/forgejo-actions/token.age".publicKeys = tanker;

  "agenix/hosts/tanker/headscale/dbPassword.age".publicKeys = tanker;
  "agenix/hosts/tanker/headscale/acls.age".publicKeys = tanker;

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

  "agenix/hosts/tanker/anonymous-overflow/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/invidious/databasePassword.age".publicKeys = tanker;
  "agenix/hosts/tanker/invidious/extraSettings.age".publicKeys = tanker;

  "agenix/hosts/tanker/linkding/environment.age".publicKeys = tanker;

  "agenix/hosts/tanker/proxitok/environment.age".publicKeys = tanker;

  "agenix/hosts/tanker/synapse/extraConfig.age".publicKeys = tanker;
  "agenix/hosts/tanker/synapse/slidingSyncConfig.age".publicKeys = tanker;

  "agenix/hosts/tanker/mautrix-signal/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/mautrix-whatsapp/config.age".publicKeys = tanker;

  "agenix/hosts/tanker/weewx/config.age".publicKeys = tanker;
  "agenix/hosts/tanker/weewx/skin.age".publicKeys = tanker;

  # mediaserver
  "agenix/hosts/mediaserver/user/danielPassword.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/smb/havenCredentials.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/acme/credentials.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tailscale/authkey.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/wireguard/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentTA.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentES.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/aria2/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/recyclarr/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/unpackerr/config.age".publicKeys = mediaserver;

  # argon
  "agenix/hosts/argon/user/danielPassword.age".publicKeys = argon;

  "agenix/hosts/argon/acme/credentials.age".publicKeys = argon;

  "agenix/hosts/argon/forgejo-actions/token.age".publicKeys = argon;

  "agenix/hosts/argon/tailscale/authkey.age".publicKeys = argon;

  "agenix/hosts/argon/adguardhome-sync/environment.age".publicKeys = argon;

  "agenix/hosts/argon/weewx-proxy/environment.age".publicKeys = argon;

  # neon 
  "agenix/hosts/neon/user/danielPassword.age".publicKeys = neon;

  "agenix/hosts/neon/tailscale/authkey.age".publicKeys = neon;

  "agenix/hosts/neon/forgejo-actions/token.age".publicKeys = neon;

  "agenix/hosts/neon/mosquitto/passwordWeewxProxy.age".publicKeys = neon;
}
