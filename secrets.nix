let
  user-daniel-Styx = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1UfCIu7jUe64iQmp2UUyAgqZ3IYdMOo/Me6hRTnKoG";
  user-daniel-Pallas = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOg47WuNIBJ5h44XU2nzlW96VZuxUhm9ow1xUK5xDD9i";

  system-tanker = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILpnogLd3Ttmz/At0dXveaG1xF37vV7lz34ojDTIuCOi";
  system-mediaserver = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDlB0cL5CtTOyARWSE2yUsNU4JHUPmr71710mZHzsmbX";
  system-argon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPP9ygczyi6g8abvj1I0eAj7N2Rli9UMlkC8VT6SnWLU";
  system-neon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA5Ht4KaRUvuGFmYLznTkVSnn6isjrcVplz1kKWkrnRQ";
  syetsm-adsb-antenna = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBkjUSiku9spAlFkZ1T1IvyToE/yF1HUAjDxxH1dKKAv";

  tanker = [ user-daniel-Styx user-daniel-Pallas system-tanker ];
  mediaserver = [ user-daniel-Styx user-daniel-Pallas system-mediaserver ];
  argon = [ user-daniel-Styx user-daniel-Pallas system-argon ];
  neon = [ user-daniel-Styx user-daniel-Pallas system-neon ];
  adsb-antenna = [ user-daniel-Styx user-daniel-Pallas syetsm-adsb-antenna ];
  all-systems = [ user-daniel-Styx user-daniel-Pallas system-tanker system-mediaserver system-argon system-neon syetsm-adsb-antenna ];
in
{
  # all
  "agenix/hosts/all/nix/netrc.age".publicKeys = all-systems;
  "agenix/hosts/all/nix/forgejo_runner_netrc.age".publicKeys = all-systems;

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

  "agenix/hosts/mediaserver/controld/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentTA.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentES.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/aria2/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/recyclarr/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/unpackerr/config.age".publicKeys = mediaserver;

  # argon
  "agenix/hosts/argon/user/danielPassword.age".publicKeys = argon;

  "agenix/hosts/argon/acme/credentials.age".publicKeys = argon;

  "agenix/hosts/argon/cfdyndns/apiToken.age".publicKeys = argon;

  "agenix/hosts/argon/controld/config.age".publicKeys = argon;

  "agenix/hosts/argon/forgejo-actions/token.age".publicKeys = argon;

  "agenix/hosts/argon/mosquitto/passwordWeewxProxy.age".publicKeys = argon;

  "agenix/hosts/argon/mosquitto/passwordHomeAssistant.age".publicKeys = argon;

  "agenix/hosts/argon/tailscale/authkey.age".publicKeys = argon;

  "agenix/hosts/argon/adguardhome-sync/environment.age".publicKeys = argon;

  "agenix/hosts/argon/ups/primaryPassword.age".publicKeys = argon;

  "agenix/hosts/argon/weewx-proxy/environment.age".publicKeys = argon;

  # neon 
  "agenix/hosts/neon/user/danielPassword.age".publicKeys = neon;

  "agenix/hosts/neon/tailscale/authkey.age".publicKeys = neon;

  "agenix/hosts/neon/controld/config.age".publicKeys = neon;

  "agenix/hosts/neon/forgejo-actions/token.age".publicKeys = neon;

  "agenix/hosts/neon/mosquitto/passwordWeewxProxy.age".publicKeys = neon;

  "agenix/hosts/neon/mosquitto/passwordHomeAssistant.age".publicKeys = neon;

  "agenix/hosts/neon/deye-mqtt/config.age".publicKeys = neon;

  # adsb-antenna
  "agenix/hosts/adsb-antenna/user/danielPassword.age".publicKeys = adsb-antenna;

  "agenix/hosts/adsb-antenna/container/adsb-environment.age".publicKeys = adsb-antenna;

  # Styx
  "agenix/hosts/Styx/git/maintenance.age".publicKeys = [ user-daniel-Styx ];

  # Pallas
  "agenix/hosts/Pallas/git/maintenance.age".publicKeys = [ user-daniel-Pallas ];
}
