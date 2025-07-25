{
  age.secrets = {
    nix-netrc = {
      file = ../all/nix/netrc.age;
      path = "/etc/nix/netrc";
      mode = "440";
      symlink = false;
    };

    nix-forgejo-runner-netrc = {
      file = ../all/nix/forgejo_runner_netrc.age;
      mode = "440";
    };

    user-daniel-password = {
      file = ./user/danielPassword.age;
    };

    attic-config = {
      file = ../all/attic/config.age;
      path = "/home/daniel/.config/attic/config.toml";
      mode = "600";
      owner = "daniel";
      group = "users";
    };

    acme-credentials = {
      file = ./acme/credentials.age;
      owner = "acme";
      group = "acme";
    };

    caddy-environment = {
      file = ../all/caddy/environment.age;
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    msmtp-password = {
      file = ./msmtp/password.age;
      mode = "444";
    };

    ntfy-token-hardware = {
      file = ./ntfy/token-hardware.age;
      mode = "444";
    };

    fedifetcher-config = {
      file = ./fedifetcher/config.age;
    };

    forgejo-actions-token = {
      file = ./forgejo-actions/token.age;
    };

    mautrix-signal = {
      file = ./mautrix/signal.age;
    };

    mautrix-whatsapp = {
      file = ./mautrix/whatsapp.age;
    };

    restic-password = {
      file = ./restic/password.age;
    };

    restic-ssh-private-key = {
      file = ./restic/ssh-private-key.age;
    };

    vaultwarden-config = {
      file = ./vaultwarden/config.age;
    };
  };
}
