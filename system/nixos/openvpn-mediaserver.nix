{ config, ... }:

{
  services.openvpn.servers = {
    pp = {
      config = ''
        auth-user-pass ${config.age.secrets.openvpn-auth-pp.path}
        config ${config.age.secrets.openvpn-pp-nbg.path}
      '';
      updateResolvConf = false;
    };
  };
}
