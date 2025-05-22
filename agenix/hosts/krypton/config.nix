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

    acme-credentials = {
      file = ./acme/credentials.age;
      owner = "acme";
      group = "acme";
    };

    podman-auth = {
      file = ./podman/auth.age;
      path = "/root/.docker/config.json";
      mode = "400";
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    wireguard-config-dl = {
      file = ./wireguard/config-dl.age;
    };

    wireguard-config-sc = {
      file = ./wireguard/config-sc.age;
    };
  };
}
