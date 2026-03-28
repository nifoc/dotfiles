{
  pkgs,
  lib,
  config,
  ...
}:

let
  fqdn = "frigate.internal.kempkens.network";
  fqdnLocal = "frigate-local.internal.kempkens.network";
  internalIP = "127.0.0.1";
  internalPort = 8080;

  frigateEnvRefs =
    url:
    if builtins.typeOf url == "list" then
      builtins.map frigateEnvRefs url
    else
      builtins.replaceStrings [ "\${" ] [ "{" ] url;

  ips = import ../shared/ips.nix;
in
{
  services = {
    frigate = {
      enable = true;

      hostname = fqdn;
      vaapiDriver = "iHD";
      checkConfig = false;

      settings = {
        mqtt = {
          enabled = true;
          host = "10.0.0.230";
          port = 1883;
          user = "frigate";
          password = "{FRIGATE_MQTT_PASSWORD}";
        };

        ffmpeg = {
          hwaccel_args = "preset-vaapi";
          apple_compatibility = true;
        };

        detectors = {
          ov_0 = {
            type = "openvino";
            device = "GPU";
          };
        };

        model = {
          # yolov9s
          path = "plus://b83061512206a1c411c2f4a88358381b";
        };

        tls.enabled = false;
        auth.enabled = false;

        proxy = {
          header_map = {
            user = "remote-user";
            role = "remote-groups";

            role_map = {
              admin = [ "full-access" ];
              viewer = [ "camera-viewer" ];
            };
          };

          default_role = "viewer";
        };

        cameras = {
          eingang = {
            enabled = true;
            type = "generic";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/eingang";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/eingang_sub";
                  input_args = "preset-rtsp-restream";
                  roles = [
                    "detect"
                    "audio"
                  ];
                }
              ];

              output_args = {
                record = "preset-record-ubiquiti";
              };
            };

            detect = {
              enabled = true;
              fps = 5;
            };

            motion = {
              threshold = 60;
              contour_area = 40;

              mask = [
                # Date & Time
                "0,0.039,0.17,0.039,0.171,0,0,0"
              ];
            };

            objects = {
              track = [
                "person"
                "face"
                "dog"
                "cat"
                "horse"
                "bird"
                "car"
                "motorcycle"
                "bicycle"
                "license_plate"
                "amazon"
                "ups"
                "dhl"
                "gls"
                "dpd"
              ];
              filters.person = {
                min_score = 0.8;
                threshold = 0.75;
              };
            };

            audio = {
              enabled = true;
              listen = [
                "bark"
                "scream"
                "speech"
                "yell"
                "crying"
                "fire_alarm"
                "ambulance"
                "police_car"
              ];
            };

            lpr.enabled = true;

            record = {
              enabled = true;
              continuous.days = 3;
              alerts.retain = {
                days = 7;
                mode = "all";
              };
              detections.retain = {
                days = 7;
                mode = "all";
              };
            };
          };

          garage = {
            enabled = true;
            type = "generic";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/garage";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/garage_sub";
                  input_args = "preset-rtsp-restream";
                  roles = [
                    "detect"
                    "audio"
                  ];
                }
              ];

              output_args = {
                record = "preset-record-ubiquiti";
              };
            };

            detect = {
              enabled = true;
              fps = 5;
            };

            objects = {
              track = [
                "person"
                "face"
                "dog"
                "cat"
                "car"
                "motorcycle"
                "bicycle"
                "license_plate"
              ];
              filters.person = {
                min_score = 0.8;
                threshold = 0.75;
              };
            };

            audio = {
              enabled = true;
              listen = [
                "bark"
                "scream"
                "speech"
                "yell"
                "crying"
                "fire_alarm"
                "ambulance"
                "police_car"
              ];
            };

            motion = {
              threshold = 60;
              contour_area = 50;

              mask = [
                # Date & Time
                "0.001,0.035,0.158,0.035,0.158,0,0,0"
              ];
            };

            lpr.enabled = true;

            record = {
              enabled = true;
              continuous.days = 0;
              alerts.retain = {
                days = 7;
                mode = "motion";
              };
              detections.retain = {
                days = 7;
                mode = "motion";
              };
            };
          };

          ofen = {
            enabled = true;
            type = "generic";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/ofen";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/ofen_sub";
                  input_args = "preset-rtsp-restream";
                  roles = [ "detect" ];
                }
              ];

              output_args = {
                record = "preset-record-ubiquiti";
              };
            };

            detect = {
              enabled = false;
              fps = 5;
            };

            objects = {
              track = [
                "person"
                "face"
              ];
              filters.person = {
                min_score = 0.8;
                threshold = 0.75;
              };
            };

            motion = {
              threshold = 60;
              contour_area = 50;

              mask = [
                # Date & Time, Fan
                "0,0.07,0.394,0.069,0.394,0,0.001,0.001"
                # Fire
                "0.527,0.544,0.535,0.637,0.593,0.634,0.593,0.544"
              ];
            };

            lpr.enabled = false;

            record = {
              enabled = false;
              continuous.days = 0;
              alerts.retain = {
                days = 7;
                mode = "motion";
              };
              detections.retain = {
                days = 7;
                mode = "motion";
              };
            };
          };

          schuppen = {
            enabled = true;
            type = "generic";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/schuppen";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/schuppen_sub";
                  input_args = "preset-rtsp-restream";
                  roles = [
                    "detect"
                    "audio"
                  ];
                }
              ];

              output_args = {
                record = "preset-record-ubiquiti";
              };
            };

            detect = {
              enabled = true;
              fps = 5;
            };

            objects = {
              track = [
                "person"
                "face"
                "dog"
                "cat"
                "horse"
                "bird"
                "car"
                "motorcycle"
                "bicycle"
                "amazon"
                "ups"
                "dhl"
                "gls"
                "dpd"
              ];
              filters.person = {
                min_score = 0.8;
                threshold = 0.75;
              };
            };

            audio = {
              enabled = true;
              listen = [
                "bark"
                "scream"
                "speech"
                "yell"
                "crying"
                "fire_alarm"
                "ambulance"
                "police_car"
              ];
            };

            motion = {
              threshold = 60;
              contour_area = 50;

              mask = [
                # Date & Time
                "0.001,0.035,0.158,0.035,0.158,0,0,0"
              ];
            };

            lpr.enabled = false;

            record = {
              enabled = true;
              continuous.days = 0;
              alerts.retain = {
                days = 7;
                mode = "motion";
              };
              detections.retain = {
                days = 7;
                mode = "motion";
              };
            };
          };

          terrasse = {
            enabled = true;
            type = "generic";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/terrasse";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/terrasse_sub";
                  input_args = "preset-rtsp-restream";
                  roles = [
                    "detect"
                    "audio"
                  ];
                }
              ];

              output_args = {
                record = "preset-record-ubiquiti";
              };
            };

            detect = {
              enabled = true;
              fps = 5;
            };

            motion = {
              threshold = 60;
              contour_area = 40;

              mask = [
                # Date & Time
                "0,0.039,0.17,0.039,0.171,0,0,0"
              ];
            };

            objects = {
              track = [
                "person"
                "face"
                "dog"
                "cat"
                "horse"
                "bird"
                "car"
                "motorcycle"
                "bicycle"
                "amazon"
                "ups"
                "dhl"
                "gls"
                "dpd"
              ];
              filters.person = {
                min_score = 0.8;
                threshold = 0.75;
              };
            };

            audio = {
              enabled = true;
              listen = [
                "bark"
                "scream"
                "speech"
                "yell"
                "crying"
                "fire_alarm"
                "ambulance"
                "police_car"
              ];
            };

            lpr.enabled = false;

            record = {
              enabled = true;
              continuous.days = 3;
              alerts.retain = {
                days = 7;
                mode = "all";
              };
              detections.retain = {
                days = 7;
                mode = "all";
              };
            };
          };

          waschkeller = {
            enabled = true;
            type = "generic";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/waschkeller";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/waschkeller_sub";
                  input_args = "preset-rtsp-restream";
                  roles = [
                    "detect"
                    "audio"
                  ];
                }
              ];

              output_args = {
                record = "preset-record-ubiquiti";
              };
            };

            detect = {
              enabled = true;
              fps = 5;
            };

            objects = {
              track = [
                "person"
                "face"
              ];
              filters.person = {
                min_score = 0.8;
                threshold = 0.75;
              };
            };

            audio = {
              enabled = true;
              listen = [
                "scream"
                "speech"
                "yell"
                "fire_alarm"
              ];
            };

            motion = {
              threshold = 75;
              contour_area = 50;

              mask = [
                # Date & Time
                "0.001,0.035,0.158,0.035,0.158,0,0,0"
              ];
            };

            lpr.enabled = false;

            record = {
              enabled = true;
              continuous.days = 0;
              alerts.retain = {
                days = 7;
                mode = "motion";
              };
              detections.retain = {
                days = 7;
                mode = "motion";
              };
            };
          };
        };

        record.enabled = false;

        snapshots = {
          enabled = true;
          timestamp = false;
          bounding_box = true;
          retain.default = 90;
        };

        audio.enabled = false;
        motion.enabled = true;

        face_recognition = {
          enabled = true;
          model_size = "large";
        };

        lpr = {
          enabled = true;
          device = "GPU";
        };

        classification.bird.enabled = true;

        timestamp_style = {
          format = "%d.%m.%Y %H:%M:%S";
        };

        go2rtc =
          let
            go2rtcCfg = config.services.go2rtc.settings;
          in
          {
            streams = builtins.mapAttrs (_: v: frigateEnvRefs v) go2rtcCfg.streams;
            inherit (go2rtcCfg) webrtc;
          };
      };
    };

    go2rtc = {
      enable = true;

      settings = {
        streams = {
          # Garage
          eingang = "rtsp://10.0.50.13:554/s0";
          eingang_sub = "rtsp://10.0.50.13:554/s2";

          # Garage
          garage = "rtsp://10.0.50.12:554/s0";
          garage_sub = "rtsp://10.0.50.12:554/s2";

          # Ofen
          ofen = "rtspx://10.0.0.1:7441/\${FRIGATE_CAMERA_OFEN_STREAM_MAIN}";
          ofen_sub = [
            "rtspx://10.0.0.1:7441/\${FRIGATE_CAMERA_OFEN_STREAM_SUB}"
            "ffmpeg:ofen_sub#video=h264#hardware=vaapi#fps=5"
          ];

          # Schuppen
          schuppen = "rtsp://10.0.50.11:554/s0";
          schuppen_sub = "rtsp://10.0.50.11:554/s2";

          # Terrasse
          terrasse = "rtspx://10.0.0.1:7441/\${FRIGATE_CAMERA_TERRASSE_STREAM_MAIN}";
          terrasse_sub = [
            "rtspx://10.0.0.1:7441/\${FRIGATE_CAMERA_TERRASSE_STREAM_SUB}"
            "ffmpeg:terrasse_sub#video=h264#audio=copy#hardware=vaapi#fps=5"
          ];

          # Waschkeller
          waschkeller = "rtsp://10.0.50.10:554/s0";
          waschkeller_sub = "rtsp://10.0.50.10:554/s2";
        };

        webrtc = {
          candidates = [
            "${fqdn}:8555"
          ];
        };
      };
    };

    caddy = {
      virtualHosts."${fqdn}" = {
        extraConfig = ''
          encode

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          import tinyauth

          reverse_proxy ${internalIP}:${toString internalPort} {
            flush_interval -1
          }
        '';
      };

      virtualHosts."${fqdnLocal}:5000" = {
        listenAddresses = [ "10.0.0.101" ];
        extraConfig = ''
          encode

          reverse_proxy 127.0.0.1:5000
        '';
      };
    };

    nginx = {
      defaultListenAddresses = [ internalIP ];
      defaultHTTPListenPort = internalPort;
    };
  };

  systemd.services = {
    frigate = {
      restartTriggers = [
        "${config.age.secrets.frigate-environment.file}"
      ];

      serviceConfig.EnvironmentFile = config.age.secrets.frigate-environment.path;
    };

    go2rtc = {
      restartTriggers = [
        "${config.age.secrets.frigate-environment.file}"
      ];

      serviceConfig.EnvironmentFile = config.age.secrets.frigate-environment.path;
    };
  };

  networking.firewall = {
    extraCommands = ''
      iptables -A INPUT -p tcp -s 10.0.0.230 --dport 5000 -j ACCEPT -i eth0

      iptables -A INPUT -p tcp -s 10.0.0.230 --dport 8554 -j ACCEPT -i eth0
      iptables -A INPUT -p udp -s 10.0.0.230 --dport 8554 -j ACCEPT -i eth0

      iptables -A INPUT -p tcp -s 10.0.0.230 --dport 8555 -j ACCEPT -i eth0
      iptables -A INPUT -p udp -s 10.0.0.230 --dport 8555 -j ACCEPT -i eth0
    '';

    interfaces."tailscale0" = {
      allowedTCPPorts = [
        8554
        8555
      ];
      allowedUDPPorts = [
        8554
        8555
      ];
    };
  };

  virtualisation.quadlet.containers.tinyauth.containerConfig.environments = {
    TINYAUTH_AUTH_SESSIONEXPIRY = "604800";
    TINYAUTH_APPS_FRIGATE_CONFIG_DOMAIN = fqdn;
    TINYAUTH_APPS_FRIGATE_IP_BYPASS = lib.strings.concatStringsSep "," (
      ips.tailscale.gerdas-iphone ++ ips.tailscale.udos-iphone ++ ips.tailscale.daniels-iphone
    );
  };

  environment.systemPackages = with pkgs; [
    intel-gpu-tools
  ];
}
