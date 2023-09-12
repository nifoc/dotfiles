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

    unpackerr-config = {
      file = ./unpackerr/config.age;
      owner = "media_user";
      group = "media_group";
    };
  };
}
