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

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };
  };
}
