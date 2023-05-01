let
  user-daniel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1UfCIu7jUe64iQmp2UUyAgqZ3IYdMOo/Me6hRTnKoG";

  system-sail = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJMs1BqZ+MC7XBwV+dZW8EmaZt2cOg/xcOBPS9KSzIl";
  system-attic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHe6N3LfPxu7KNsyuI8YE3R0OHLTxNw5+WhuQjKL6PUr";
  system-mediaserver = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDlB0cL5CtTOyARWSE2yUsNU4JHUPmr71710mZHzsmbX";

  sail = [ user-daniel system-sail ];
  attic = [ user-daniel system-attic ];
  mediaserver = [ user-daniel system-mediaserver ];
in
{
  # sail
  "agenix/hosts/sail/acme/credentials.age".publicKeys = sail;

  "agenix/hosts/sail/tailscale/authkey.age".publicKeys = sail;

  "agenix/hosts/sail/mastodon/databasePassword.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/smtpPassword.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/otpSecret.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/secretKeyBase.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/vapidPrivateKey.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/vapidPublicKey.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/extraConfig.age".publicKeys = sail;

  "agenix/hosts/sail/synapse/extraConfig.age".publicKeys = sail;

  "agenix/hosts/sail/signald/environment.age".publicKeys = sail;

  "agenix/hosts/sail/weewx/config.age".publicKeys = sail;
  "agenix/hosts/sail/weewx/skin.age".publicKeys = sail;

  "agenix/hosts/sail/mosquitto/passwordWeewxProxy.age".publicKeys = sail;
  "agenix/hosts/sail/mosquitto/passwordWeewx.age".publicKeys = sail;

  "agenix/hosts/sail/atuin/environment.age".publicKeys = sail;

  "agenix/hosts/sail/freshrss/userPassword.age".publicKeys = sail;
  "agenix/hosts/sail/freshrss/databasePassword.age".publicKeys = sail;

  "agenix/hosts/sail/invidious/databasePassword.age".publicKeys = sail;

  "agenix/hosts/sail/nitter/config.age".publicKeys = sail;

  "agenix/hosts/sail/anonymous-overflow/config.age".publicKeys = sail;

  "agenix/hosts/sail/proxitok/environment.age".publicKeys = sail;

  # attic
  "agenix/hosts/attic/user/danielPassword.age".publicKeys = attic;

  "agenix/hosts/attic/acme/credentials.age".publicKeys = attic;

  "agenix/hosts/attic/tailscale/authkey.age".publicKeys = attic;

  "agenix/hosts/attic/atticd/environment.age".publicKeys = attic;

  # mediaserver
  "agenix/hosts/mediaserver/user/danielPassword.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/acme/credentials.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tailscale/authkey.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/wireguard/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentTA.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/tubearchivist/environmentES.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/aria2/config.age".publicKeys = mediaserver;

  "agenix/hosts/mediaserver/homepage-dashboard/services.age".publicKeys = mediaserver;
}
