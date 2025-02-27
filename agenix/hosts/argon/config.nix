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

    acme-credentials = {
      file = ./acme/credentials.age;
      owner = "acme";
      group = "acme";
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    controld-config = {
      file = ./controld/config.age;
      path = "/var/lib/controld/ctrld.toml";
    };

    adguardhome-sync-environment = {
      file = ./adguardhome-sync/environment.age;
    };

    forgejo-actions-token = {
      file = ./forgejo-actions/token.age;
    };

    mosquitto-password-weewx-proxy = {
      file = ./mosquitto/passwordWeewxProxy.age;
      owner = "mosquitto";
      group = "mosquitto";
    };

    mosquitto-password-home-assistant = {
      file = ./mosquitto/passwordHomeAssistant.age;
      owner = "mosquitto";
      group = "mosquitto";
    };

    ups-primary-password = {
      file = ./ups/primaryPassword.age;
    };

    weewx-proxy-environment = {
      file = ./weewx-proxy/environment.age;
    };
  };
}
