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

    caddy-environment = {
      file = ../all/caddy/environment.age;
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

    mosquitto-password-weewx = {
      file = ./mosquitto/passwordWeewx.age;
      owner = "mosquitto";
      group = "mosquitto";
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

    msmtp-password = {
      file = ./msmtp/password.age;
      mode = "444";
    };

    ntfy-token-hardware = {
      file = ./ntfy/token-hardware.age;
      mode = "444";
    };

    restic-password = {
      file = ./restic/password.age;
    };

    restic-ssh-private-key = {
      file = ./restic/ssh-private-key.age;
    };

    ups-primary-password = {
      file = ./ups/primaryPassword.age;
    };

    weewx-config = {
      file = ./weewx/config.age;
      owner = "weewx";
      group = "weewx";
    };

    weewx-skin = {
      file = ./weewx/skin.age;
      path = "/var/lib/weewx-weather/overlay/upper/skins/weewx-wdc/skin.conf";
      owner = "weewx";
      group = "weewx";
    };

    weewx-proxy-environment = {
      file = ./weewx-proxy/environment.age;
    };
  };
}
