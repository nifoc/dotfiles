{
  age.secrets = {
    nix-netrc = {
      file = ../all/nix/netrc.age;
      path = "/etc/nix/netrc";
      mode = "440";
      symlink = false;
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
  };
}
