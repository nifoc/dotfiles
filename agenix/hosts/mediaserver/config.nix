{
  age.secrets = {
    user-daniel-password = {
      file = ./user/danielPassword.age;
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    openvpn-auth-pp = {
      file = ./openvpn/authPP.age;
    };

    openvpn-pp-nbg = {
      file = ./openvpn/pp-nbg.age;
    };
  };
}
