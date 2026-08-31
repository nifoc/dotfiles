{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.weewx = {
    includes = with den.aspects; [
      mqtt-broker
    ];

    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        mqttConfig = cfg.mqtt;
        networkConfig = cfg.networking;
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          weewx-mqtt-password-weewx = {
            file = ../../agenix/weewx/mqtt/password-weewx.nix;
            owner = "mosquitto";
            group = "mosquitto";
          };

          weewx-mqtt-password-weewx-proxy = {
            file = ../../agenix/weewx/mqtt/password-weewx-proxy.nix;
            owner = "mosquitto";
            group = "mosquitto";
          };

          weewx-mqtt-password-home-assistant = {
            file = ../../agenix/weewx/mqtt/password-home-assistant.nix;
            owner = "mosquitto";
            group = "mosquitto";
          };
        };

        services.mosquitto = {
          listeners = [
            # weewx
            {
              address = "127.0.0.1";
              port = 9883;

              settings = {
                protocol = "websockets";
                allow_anonymous = true;
              };

              acl = [ "topic read weather/+" ];
            }

            # weewx-proxy
            {
              address = "0.0.0.0";
              port = 1883;

              settings = {
                protocol = "mqtt";
              };

              users = {
                rtl = {
                  password = "didYouFindThis";
                  acl = [ "write rtl433" ];
                };

                weewx = {
                  hashedPasswordFile = config.age.secrets.weewx-mqtt-password-weewx.path;
                  acl = [
                    "read weewx/+"
                    "write weather/+"
                  ];
                };

                weewx-proxy = {
                  hashedPasswordFile = config.age.secrets.weewx-mqtt-password-weewx-proxy.path;
                  acl = [
                    "read rtl433"
                    "write hadata/#"
                    "write weewx/+"
                  ];
                };

                home-assistant = {
                  passwordFile = config.age.secrets.weewx-mqtt-password-home-assistant.path;
                  acl = [ "readwrite #" ];
                };
              };
            }
          ];

          bridges.home-assistant = {
            addresses = [
              {
                address = mqttConfig.home-assistant.host;
                inherit (mqttConfig.home-assistant) port;
              }
            ];
            settings = {
              remote_username = mqttConfig.home-assistant.user;
              remote_password = mqttConfig.home-assistant.password;
              try_private = true;
            };
            topics = [ "${mqttConfig.home-assistant.topic}/# out" ];
          };
        };

        networking.firewall.interfaces = {
          "${networkConfig.default.name}".allowedTCPPorts = [ 1883 ];
          "${networkConfig.iot.name}".allowedTCPPorts = [ 1883 ];
        };
      };
  };
}
