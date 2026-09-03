let
  user-daniel-Styx = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1UfCIu7jUe64iQmp2UUyAgqZ3IYdMOo/Me6hRTnKoG";
  user-daniel-Pallas = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOg47WuNIBJ5h44XU2nzlW96VZuxUhm9ow1xUK5xDD9i";

  system-carbon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEvF4zibLcXxlp4Eorc/6C30yeFItLNT2iAvGnNEscnu";
  system-boron = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEH0G+fjmO4IOULTWFWtRf8Wh5BxeGukub8qoRFd5zvA";
  system-gallium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHf93XbuF6M0GsyBmUhJjJdClAcXfiSnkoDxYhfxEj8X";
  system-krypton = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINQooOFh2618Y7sXwYE640ftsdmEr6O87jUVKw/VogtY";
  system-xenon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1DZhnlOpFLveEiF3SD6A9sbFEl+T2uvrpM566kqItv";
  system-argon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBsnqQa0PwyVEOb2WWiSI/AFQv99anRhjaW1RxT/+Qz3";
  system-neon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICNcsE77cjkwh/NjDYwHTLWtAtilIAbfI5xmffKAhPQo";
  syetsm-adsb-antenna = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBkjUSiku9spAlFkZ1T1IvyToE/yF1HUAjDxxH1dKKAv";

  carbon = [
    user-daniel-Pallas
    system-carbon
  ];
  boron = [
    user-daniel-Pallas
    system-boron
  ];
  # gallium = [
  #   user-daniel-Pallas
  #   system-gallium
  # ];
  krypton = [
    user-daniel-Pallas
    system-krypton
  ];
  xenon = [
    user-daniel-Pallas
    system-xenon
  ];
  argon = [
    user-daniel-Pallas
    system-argon
  ];
  neon = [
    user-daniel-Pallas
    system-neon
  ];
  # adsb-antenna = [
  #   user-daniel-Pallas
  #   syetsm-adsb-antenna
  # ];
  all-systems = [
    user-daniel-Styx
    user-daniel-Pallas
    system-carbon
    system-boron
    system-gallium
    system-krypton
    system-xenon
    system-argon
    system-neon
    syetsm-adsb-antenna
  ];
in
{
  "agenix/base/attic/config.age".publicKeys = all-systems;
  "agenix/base/msmtp/password.age".publicKeys = all-systems;
  "agenix/base/nix/netrc.age".publicKeys = all-systems;
  "agenix/forgejo/runner/nix-netrc.age".publicKeys = all-systems;
  "agenix/forgejo/runner/token.age".publicKeys = all-systems;
  "agenix/frigate/environment.age".publicKeys = xenon;
  "agenix/frigate/reolink-environment.age".publicKeys = xenon;
  "agenix/geoip-updater/license.age".publicKeys = all-systems;
  "agenix/gotosocial/environment.age".publicKeys = carbon;
  "agenix/gotosocial/fedifetcher/config.age".publicKeys = carbon;
  "agenix/hister/environment.age".publicKeys = neon;
  "agenix/miniflux/credentials.age".publicKeys = boron;
  "agenix/netns/wireguard/krypton/ch-config.age".publicKeys = krypton;
  "agenix/netns/wireguard/krypton/dl-config.age".publicKeys = krypton;
  "agenix/netns/wireguard/krypton/sc-config.age".publicKeys = krypton;
  "agenix/netns/wireguard/neon/hi-config.age".publicKeys = neon;
  "agenix/nix-cache/environment.age".publicKeys = boron;
  "agenix/nix-cache/niks3-access-key.age".publicKeys = boron;
  "agenix/nix-cache/niks3-api-token.age".publicKeys = all-systems;
  "agenix/nix-cache/niks3-secret-key.age".publicKeys = boron;
  "agenix/nix-cache/niks3-sign-key.age".publicKeys = boron;
  "agenix/oidc-provider/encryption-key.age".publicKeys = boron;
  "agenix/pinchflat/config.age".publicKeys = krypton;
  "agenix/podman/config.age".publicKeys = all-systems;
  "agenix/readeck/environment.age".publicKeys = krypton;
  "agenix/remote-builder/client/id_nix_remote_builder.age".publicKeys = all-systems;
  "agenix/restic/argon/remote-password.age".publicKeys = argon;
  "agenix/restic/argon/remote-ssh-private-key.age".publicKeys = argon;
  "agenix/restic/boron/remote-password.age".publicKeys = boron;
  "agenix/restic/boron/remote-ssh-private-key.age".publicKeys = boron;
  "agenix/restic/carbon/remote-password.age".publicKeys = carbon;
  "agenix/restic/carbon/remote-ssh-private-key.age".publicKeys = carbon;
  "agenix/restic/carbon/secondary-password.age".publicKeys = carbon;
  "agenix/restic/krypton/remote-password.age".publicKeys = krypton;
  "agenix/restic/krypton/remote-ssh-private-key.age".publicKeys = krypton;
  "agenix/restic/krypton/secondary-password.age".publicKeys = krypton;
  "agenix/tailscale/authkey.age".publicKeys = all-systems;
  "agenix/unpackerr/config.age".publicKeys = krypton;
  "agenix/ups/argon/primary-password.age".publicKeys = argon;
  "agenix/ups/krypton/primary-password.age".publicKeys = krypton;
  "agenix/users/daniel/password.age".publicKeys = all-systems;
  "agenix/vaultwarden/config.age".publicKeys = carbon;
  "agenix/webdav-server/environment.age".publicKeys = krypton;
  "agenix/webserver/caddy/environment.age".publicKeys = all-systems;
  "agenix/webserver/tinyauth/environment.age".publicKeys = all-systems;
  "agenix/weewx/config.age".publicKeys = argon;
  "agenix/weewx/skin.age".publicKeys = argon;
  "agenix/weewx/mqtt/password-home-assistant.age".publicKeys = argon;
  "agenix/weewx/mqtt/password-weewx.age".publicKeys = argon;
  "agenix/weewx/mqtt/password-weewx-proxy.age".publicKeys = argon;
  "agenix/weewx/proxy/environment.age".publicKeys = argon;
  "agenix/woodpecker/environment.age".publicKeys = carbon;
  "agenix/woodpecker/agent/environment.age".publicKeys = all-systems;
  "agenix/xmpp-server/acme/credentials.age".publicKeys = carbon;
  "agenix/xmpp-server/coturn/static-auth.age".publicKeys = carbon;
  "agenix/xmpp-server/prosody/environment.age".publicKeys = carbon;
  "agenix/yubikey/u2f_keys.age".publicKeys = [ user-daniel-Pallas ];
}
