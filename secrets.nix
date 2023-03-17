let
  user-daniel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1UfCIu7jUe64iQmp2UUyAgqZ3IYdMOo/Me6hRTnKoG";

  system-sail = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJMs1BqZ+MC7XBwV+dZW8EmaZt2cOg/xcOBPS9KSzIl";

  sail = [ user-daniel system-sail ];
in
{
  # sail
  "agenix/hosts/sail/acme/credentials.age".publicKeys = sail;

  "agenix/hosts/sail/mastodon/databasePassword.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/smtpPassword.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/otpSecret.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/secretKeyBase.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/vapidPrivateKey.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/vapidPublicKey.age".publicKeys = sail;
  "agenix/hosts/sail/mastodon/extraConfig.age".publicKeys = sail;

  "agenix/hosts/sail/synapse/extraConfig.age".publicKeys = sail;

  "agenix/hosts/sail/mosquitto/passwordWeewxProxy.age".publicKeys = sail;
  "agenix/hosts/sail/mosquitto/passwordWeewx.age".publicKeys = sail;

  "agenix/hosts/sail/atuin/environment.age".publicKeys = sail;

  "agenix/hosts/sail/freshrss/userPassword.age".publicKeys = sail;
  "agenix/hosts/sail/freshrss/databasePassword.age".publicKeys = sail;

  "agenix/hosts/sail/nitter/config.age".publicKeys = sail;
  "agenix/hosts/sail/nitter/auth.age".publicKeys = sail;

  "agenix/hosts/sail/libreddit/auth.age".publicKeys = sail;

  "agenix/hosts/sail/rimgo/auth.age".publicKeys = sail;

  "agenix/hosts/sail/anonymous-overflow/config.age".publicKeys = sail;
  "agenix/hosts/sail/anonymous-overflow/auth.age".publicKeys = sail;

  "agenix/hosts/sail/proxitok/environment.age".publicKeys = sail;
  "agenix/hosts/sail/proxitok/auth.age".publicKeys = sail;
}
