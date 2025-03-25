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

    smb-haven-credentials = {
      file = ./smb/havenCredentials.age;
    };

    acme-credentials = {
      file = ./acme/credentials.age;
      owner = "acme";
      group = "acme";
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    wireguard-config = {
      file = ./wireguard/config.age;
    };

    controld-config = {
      file = ./controld/config.age;
      path = "/var/lib/controld/ctrld.toml";
    };

    tubearchivist-environment-ta = {
      file = ./tubearchivist/environmentTA.age;
    };

    tubearchivist-environment-es = {
      file = ./tubearchivist/environmentES.age;
    };

    aria2-config = {
      file = ./aria2/config.age;
      owner = "media_user";
      group = "media_group";
    };

    recyclarr-config = {
      file = ./recyclarr/config.age;
      symlink = false;
      path = "/var/lib/recyclarr/recyclarr.yml";
      owner = "1000";
      group = "1000";
    };

    unpackerr-config = {
      file = ./unpackerr/config.age;
      owner = "media_user";
      group = "media_group";
    };
  };
}
