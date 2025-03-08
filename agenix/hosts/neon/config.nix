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

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    controld-config = {
      file = ./controld/config.age;
      path = "/var/lib/controld/ctrld.toml";
    };

    forgejo-actions-token = {
      file = ./forgejo-actions/token.age;
    };

    # mosquitto-password-weewx-proxy = {
    #   file = ./mosquitto/passwordWeewxProxy.age;
    #   owner = "mosquitto";
    #   group = "mosquitto";
    # };
    #
    # mosquitto-password-home-assistant = {
    #   file = ./mosquitto/passwordHomeAssistant.age;
    #   owner = "mosquitto";
    #   group = "mosquitto";
    # };
    #
    # deye-mqtt-config = {
    #   file = ./deye-mqtt/config.age;
    # };
  };
}
