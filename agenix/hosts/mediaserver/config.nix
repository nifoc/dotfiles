{
  age.secrets = {
    user-daniel-password = {
      file = ./user/danielPassword.age;
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

    homepage-dashboard-services = {
      file = ./homepage-dashboard/services.age;
      symlink = false;
      path = "/var/lib/homepage-dashboard/services.yaml";
      mode = "640";
      owner = "media_user";
      group = "media_group";
    };

    homepage-dashboard-bookmarks = {
      file = ./homepage-dashboard/bookmarks.age;
      symlink = false;
      path = "/var/lib/homepage-dashboard/bookmarks.yaml";
      mode = "640";
      owner = "media_user";
      group = "media_group";
    };
  };
}
