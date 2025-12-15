let
  user-daniel-Styx = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1UfCIu7jUe64iQmp2UUyAgqZ3IYdMOo/Me6hRTnKoG";
  user-daniel-Pallas = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOg47WuNIBJ5h44XU2nzlW96VZuxUhm9ow1xUK5xDD9i";

  system-tanker = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILpnogLd3Ttmz/At0dXveaG1xF37vV7lz34ojDTIuCOi";
  system-carbon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEvF4zibLcXxlp4Eorc/6C30yeFItLNT2iAvGnNEscnu";
  system-boron = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEH0G+fjmO4IOULTWFWtRf8Wh5BxeGukub8qoRFd5zvA";
  system-krypton = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINQooOFh2618Y7sXwYE640ftsdmEr6O87jUVKw/VogtY";
  system-mediaserver = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDlB0cL5CtTOyARWSE2yUsNU4JHUPmr71710mZHzsmbX";
  system-argon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPP9ygczyi6g8abvj1I0eAj7N2Rli9UMlkC8VT6SnWLU";
  system-neon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA5Ht4KaRUvuGFmYLznTkVSnn6isjrcVplz1kKWkrnRQ";
  syetsm-adsb-antenna = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBkjUSiku9spAlFkZ1T1IvyToE/yF1HUAjDxxH1dKKAv";

  tanker = [
    user-daniel-Styx
    user-daniel-Pallas
    system-tanker
  ];
  carbon = [
    user-daniel-Styx
    user-daniel-Pallas
    system-carbon
  ];
  boron = [
    user-daniel-Styx
    user-daniel-Pallas
    system-boron
  ];
  krypton = [
    user-daniel-Pallas
    system-krypton
  ];
  mediaserver = [
    user-daniel-Styx
    user-daniel-Pallas
    system-mediaserver
  ];
  argon = [
    user-daniel-Styx
    user-daniel-Pallas
    system-argon
  ];
  neon = [
    user-daniel-Styx
    user-daniel-Pallas
    system-neon
  ];
  adsb-antenna = [
    user-daniel-Styx
    user-daniel-Pallas
    syetsm-adsb-antenna
  ];
  all-systems = [
    user-daniel-Styx
    user-daniel-Pallas
    system-tanker
    system-carbon
    system-boron
    system-krypton
    system-mediaserver
    system-argon
    system-neon
    syetsm-adsb-antenna
  ];
in
{
  # all
  "agenix/hosts/all/nix/netrc.age".publicKeys = all-systems;
  "agenix/hosts/all/nix/id_nix_remote_builder.age".publicKeys = all-systems;
  "agenix/hosts/all/nix/forgejo_runner_netrc.age".publicKeys = all-systems;
  "agenix/hosts/all/attic/config.age".publicKeys = all-systems;
  "agenix/hosts/all/caddy/environment.age".publicKeys = all-systems;

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

  # carbon
  "agenix/hosts/carbon/user/danielPassword.age".publicKeys = carbon;

  "agenix/hosts/carbon/acme/credentials.age".publicKeys = carbon;

  "agenix/hosts/carbon/geoipupdate/license.age".publicKeys = carbon;

  "agenix/hosts/carbon/ntfy/token-hardware.age".publicKeys = carbon;

  "agenix/hosts/carbon/tailscale/authkey.age".publicKeys = carbon;

  "agenix/hosts/carbon/msmtp/password.age".publicKeys = carbon;

  "agenix/hosts/carbon/fedifetcher/config.age".publicKeys = carbon;

  "agenix/hosts/carbon/forgejo-actions/token.age".publicKeys = carbon;

  "agenix/hosts/carbon/mautrix/signal.age".publicKeys = carbon;
  "agenix/hosts/carbon/mautrix/whatsapp.age".publicKeys = carbon;

  "agenix/hosts/carbon/restic/password.age".publicKeys = carbon;
  "agenix/hosts/carbon/restic/ssh-private-key.age".publicKeys = carbon;

  "agenix/hosts/carbon/vaultwarden/config.age".publicKeys = carbon;

  # boron
  "agenix/hosts/boron/user/danielPassword.age".publicKeys = boron;

  "agenix/hosts/boron/acme/credentials.age".publicKeys = boron;

  "agenix/hosts/boron/msmtp/password.age".publicKeys = boron;

  "agenix/hosts/boron/ntfy/token-hardware.age".publicKeys = boron;

  "agenix/hosts/boron/tailscale/authkey.age".publicKeys = boron;

  "agenix/hosts/boron/atticd/environment.age".publicKeys = boron;

  "agenix/hosts/boron/forgejo-actions/token.age".publicKeys = boron;

  "agenix/hosts/boron/miniflux/credentials.age".publicKeys = boron;

  "agenix/hosts/boron/restic/password.age".publicKeys = boron;
  "agenix/hosts/boron/restic/ssh-private-key.age".publicKeys = boron;

  # krypton
  "agenix/hosts/krypton/user/danielPassword.age".publicKeys = krypton;

  "agenix/hosts/krypton/acme/credentials.age".publicKeys = krypton;

  "agenix/hosts/krypton/homepage/environment.age".publicKeys = krypton;

  "agenix/hosts/krypton/linkwarden/environment.age".publicKeys = krypton;

  "agenix/hosts/krypton/msmtp/password.age".publicKeys = krypton;

  "agenix/hosts/krypton/ntfy/token-hardware.age".publicKeys = krypton;

  "agenix/hosts/krypton/pinchflat/config.age".publicKeys = krypton;

  "agenix/hosts/krypton/podman/auth.age".publicKeys = krypton;

  "agenix/hosts/krypton/readeck/environment.age".publicKeys = krypton;

  "agenix/hosts/krypton/recyclarr/config.age".publicKeys = krypton;

  "agenix/hosts/krypton/restic/password.age".publicKeys = krypton;
  "agenix/hosts/krypton/restic/ssh-private-key.age".publicKeys = krypton;

  "agenix/hosts/krypton/speedtest-tracker/environment.age".publicKeys = krypton;

  "agenix/hosts/krypton/tailscale/authkey.age".publicKeys = krypton;

  "agenix/hosts/krypton/tubearchivist/environmentTA.age".publicKeys = krypton;
  "agenix/hosts/krypton/tubearchivist/environmentES.age".publicKeys = krypton;

  "agenix/hosts/krypton/unpackerr/config.age".publicKeys = krypton;

  "agenix/hosts/krypton/ups/primaryPassword.age".publicKeys = krypton;

  "agenix/hosts/krypton/wireguard/config-dl.age".publicKeys = krypton;
  "agenix/hosts/krypton/wireguard/config-sc.age".publicKeys = krypton;
  "agenix/hosts/krypton/wireguard/config-ch.age".publicKeys = krypton;

  # mediaserver
  "agenix/hosts/mediaserver/user/danielPassword.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/smb/havenCredentials.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/acme/credentials.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tailscale/authkey.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/wireguard/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/controld/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentTA.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentES.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/shiori/environment.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/aria2/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/recyclarr/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/unpackerr/config.age".publicKeys = mediaserver;

  # argon
  "agenix/hosts/argon/user/danielPassword.age".publicKeys = argon;

  "agenix/hosts/argon/acme/credentials.age".publicKeys = argon;

  "agenix/hosts/argon/cfdyndns/apiToken.age".publicKeys = argon;

  "agenix/hosts/argon/controld/config.age".publicKeys = argon;

  "agenix/hosts/argon/forgejo-actions/token.age".publicKeys = argon;

  "agenix/hosts/argon/mosquitto/passwordWeewx.age".publicKeys = argon;
  "agenix/hosts/argon/mosquitto/passwordWeewxProxy.age".publicKeys = argon;
  "agenix/hosts/argon/mosquitto/passwordHomeAssistant.age".publicKeys = argon;

  "agenix/hosts/argon/restic/password.age".publicKeys = argon;
  "agenix/hosts/argon/restic/ssh-private-key.age".publicKeys = argon;

  "agenix/hosts/argon/tailscale/authkey.age".publicKeys = argon;

  "agenix/hosts/argon/adguardhome-sync/environment.age".publicKeys = argon;

  "agenix/hosts/argon/ups/primaryPassword.age".publicKeys = argon;

  "agenix/hosts/argon/weewx/config.age".publicKeys = argon;
  "agenix/hosts/argon/weewx/skin.age".publicKeys = argon;

  "agenix/hosts/argon/weewx-proxy/environment.age".publicKeys = argon;

  # neon
  "agenix/hosts/neon/user/danielPassword.age".publicKeys = neon;

  "agenix/hosts/neon/tailscale/authkey.age".publicKeys = neon;

  "agenix/hosts/neon/controld/config.age".publicKeys = neon;

  "agenix/hosts/neon/forgejo-actions/token.age".publicKeys = neon;

  "agenix/hosts/neon/mosquitto/passwordWeewxProxy.age".publicKeys = neon;

  "agenix/hosts/neon/mosquitto/passwordHomeAssistant.age".publicKeys = neon;

  "agenix/hosts/neon/deye-mqtt/config.age".publicKeys = neon;

  "agenix/hosts/neon/z2m/secrets.age".publicKeys = neon;

  # adsb-antenna
  "agenix/hosts/adsb-antenna/user/danielPassword.age".publicKeys = adsb-antenna;

  "agenix/hosts/adsb-antenna/container/adsb-environment.age".publicKeys = adsb-antenna;

  # Styx
  # "agenix/hosts/Styx/git/maintenance.age".publicKeys = [
  #   user-daniel-Styx
  #   user-daniel-Pallas
  # ];

  # Pallas
  "agenix/hosts/Pallas/yubikey/u2f_keys.age".publicKeys = [ user-daniel-Pallas ];

  "agenix/hosts/Pallas/git/maintenance.age".publicKeys = [
    user-daniel-Pallas
    user-daniel-Styx
  ];
}
