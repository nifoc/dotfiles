{
  age.secrets = {
    user-daniel-password = {
      file = ./user/danielPassword.age;
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
