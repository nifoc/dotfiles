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

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    atticd-environment = {
      file = ./atticd/environment.age;
    };

    forgejo-actions-token = {
      file = ./forgejo-actions/token.age;
    };
  };
}
