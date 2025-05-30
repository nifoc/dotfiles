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

    homepage-environment = {
      file = ./homepage/environment.age;
    };

    podman-auth = {
      file = ./podman/auth.age;
      path = "/root/.docker/config.json";
      mode = "400";
    };

    recyclarr-config = {
      file = ./recyclarr/config.age;
      symlink = false;
      path = "/var/lib/recyclarr/recyclarr.yml";
      owner = "1000";
      group = "1000";
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    tubearchivist-environment-ta = {
      file = ./tubearchivist/environmentTA.age;
    };

    tubearchivist-environment-es = {
      file = ./tubearchivist/environmentES.age;
    };

    unpackerr-config = {
      file = ./unpackerr/config.age;
      owner = "media_user";
      group = "user_media";
    };

    ups-primary-password = {
      file = ./ups/primaryPassword.age;
    };

    wireguard-config-dl = {
      file = ./wireguard/config-dl.age;
    };

    wireguard-config-sc = {
      file = ./wireguard/config-sc.age;
    };
  };
}
