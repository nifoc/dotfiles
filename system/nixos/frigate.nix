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
  webrtcRangeStart = 50000;
  webrtcRangeEnd = 50500;

  ffmpegPkg = pkgs.ffmpeg_7-headless;

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

      package = pkgs.master.frigate;

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
          einfahrt = {
            enabled = true;
            type = "generic";
            webui_url = "http://10.0.50.16";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/einfahrt";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/einfahrt_sub";
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
              fps = 8;
            };

            motion = {
              threshold = 60;
              contour_area = 40;

              mask = [
                # Date & Time
                "0,0.039,0.17,0.039,0.171,0,0,0"
                # Bushes
                "0,0.372,0.349,0.199,0.745,0.061,1,0.128,1,0,0.161,0,0.158,0.038,0,0.038"
                # House
                "0.886,1,0.956,0.566,1,0.36,1,1"
              ];
            };

            objects = {
              track = [
                "person"
                "face"
                "dog"
                "cat"
                "horse"
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
              min_volume = 200;
              listen = [
                "bark"
                "meow"
                "scream"
                "speech"
                "yell"
                "crying"
                "car"
                "vehicle"
                "truck"
                "motorcycle"
                "motor_vehicle"
                "car_passing_by"
                "traffic_noise"
                "idling"
                "accelerating"
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

          eingang = {
            enabled = true;
            type = "generic";
            webui_url = "http://10.0.50.13";

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
              fps = 8;
            };

            motion = {
              threshold = 60;
              contour_area = 40;

              mask = [
                # Date & Time
                "0,0.039,0.17,0.039,0.171,0,0,0"
                # House
                "0.276,1,0,1,0,0.033,0.165,0.033,0.168,0,0.298,0,0.392,0.28,0.202,0.455"
                # Gutter
                "1,0.043,0.367,0.225,0.291,0,1,0"
              ];
            };

            zones = {
              eingang_weg = {
                friendly_name = "Eingang Weg";
                coordinates = "0.25,0.687,0.354,0.598,0.59,1,0.324,1";
                inertia = 3;
                objects = [ "person" ];
              };
            };

            objects = {
              track = [
                "person"
                "face"
                "dog"
                "cat"
                "horse"
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
              min_volume = 200;
              listen = [
                "bark"
                "meow"
                "scream"
                "speech"
                "yell"
                "crying"
                "car"
                "vehicle"
                "truck"
                "motorcycle"
                "motor_vehicle"
                "car_passing_by"
                "traffic_noise"
                "idling"
                "accelerating"
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

          flur_unten_a = {
            enabled = true;
            type = "generic";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/flur_unten_a";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/flur_unten_a_sub";
                  input_args = "preset-rtsp-restream";
                  roles = [ "detect" ];
                }
              ];

              output_args = {
                record = "preset-record-generic";
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

            motion = {
              threshold = 60;
              contour_area = 50;

              mask = [
                # Date & Time, Fan
                "0,0.05,0.355,0.046,0.354,0,0.001,0.001"
                # Fire
                "0.649,0.434,0.65,0.548,0.732,0.55,0.732,0.434"
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

          garage = {
            enabled = true;
            type = "generic";
            webui_url = "http://10.0.50.12";

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
                "meow"
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
                # Wall
                "0.148,0,0.14,0.064,0.244,0.11,0.264,0.059,0.703,0.038,0.702,0.13,1,0.457,1,0"
              ];
            };

            lpr.enabled = true;

            record = {
              enabled = true;
              continuous.days = 0;
              alerts.retain = {
                days = 7;
                mode = "active_objects";
              };
              detections.retain = {
                days = 7;
                mode = "active_objects";
              };
            };
          };

          garten = {
            enabled = true;
            type = "generic";
            webui_url = "http://10.0.50.14";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/garten";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/garten_sub";
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
                "meow"
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
                # Tree
                "0.227,0.995,0.194,0.032,0,0.03,0,1"
                # Sky
                "0.626,0.051,0.713,0.051,0.781,0,0,0,0,0.148,0.313,0.171"
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

          hof = {
            enabled = true;
            type = "generic";
            webui_url = "http://10.0.50.15";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/hof";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/hof_sub";
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
                # House
                "0,1,0.154,1,0.047,0.578,0.07,0.558,0.095,0.46,0.096,0.404,0,0.028"
              ];
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
              min_volume = 200;
              listen = [
                "bark"
                "meow"
                "scream"
                "speech"
                "yell"
                "crying"
                "car"
                "vehicle"
                "truck"
                "motorcycle"
                "motor_vehicle"
                "car_passing_by"
                "traffic_noise"
                "idling"
                "accelerating"
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

          keller_a = {
            enabled = true;
            type = "generic";

            ffmpeg = {
              inputs = [
                {
                  path = "rtsp://127.0.0.1:8554/keller_a";
                  input_args = "preset-rtsp-restream";
                  roles = [ "record" ];
                }

                {
                  path = "rtsp://127.0.0.1:8554/keller_a_sub";
                  input_args = "preset-rtsp-restream";
                  roles = [ "detect" ];
                }
              ];

              output_args = {
                record = "preset-record-generic";
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

            motion = {
              threshold = 60;
              contour_area = 50;

              mask = [
                # Date & Time
                "0,0.044,0.22,0.046,0.218,0,0,0"
              ];
            };

            lpr.enabled = false;

            record = {
              enabled = true;
              continuous.days = 2;
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
            webui_url = "http://10.0.50.11";

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
                "meow"
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
                # Sky
                "0,0.097,0.485,0.099,0.484,0.189,0.573,0.199,0.573,0.094,0.997,0.092,1,0,0.157,0,0.154,0.033,0,0.036"
              ];
            };

            lpr.enabled = false;

            record = {
              enabled = true;
              continuous.days = 0;
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
                "meow"
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
            webui_url = "http://10.0.50.10";

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
                mode = "active_objects";
              };
              detections.retain = {
                days = 7;
                mode = "active_objects";
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
          model_size = "small";
        };

        lpr = {
          enabled = true;
        };

        classification = {
          custom = {
            Fireplace = {
              enabled = true;
              name = "Fireplace";
              threshold = 0.8;
              state_config = {
                motion = false;
                interval = 300;
                cameras = {
                  flur_unten_a.crop = [
                    0.6466577925651917
                    0.43038371725880964
                    0.7357943904720786
                    0.5888487802043864
                  ];
                };
              };
            };
          };
        };

        timestamp_style = {
          format = "%d.%m.%Y %H:%M:%S";
        };

        ffmpeg.path = ffmpegPkg;

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
        ffmpeg.bin = lib.getExe ffmpegPkg;

        streams =
          let
            dahuaMainStream = "cam/realmonitor?channel=1&subtype=0";
            dahuaSubStream = "cam/realmonitor?channel=1&subtype=1";
          in
          {
            # Einfahrt
            einfahrt = "rtsp://10.0.50.16:554/s0";
            einfahrt_sub = "rtsp://10.0.50.16:554/s2";

            # Eingang
            eingang = "rtsp://10.0.50.13:554/s0";
            eingang_sub = "rtsp://10.0.50.13:554/s2";

            # Flur Unten
            flur_unten_a = "ffmpeg:rtsp://admin:\${FRIGATE_CAMERA_FLUR_UNTEN_PASSWORD}@10.0.50.61:554/${dahuaMainStream}";
            flur_unten_a_sub = "ffmpeg:rtsp://admin:\${FRIGATE_CAMERA_FLUR_UNTEN_PASSWORD}@10.0.50.61:554/${dahuaSubStream}";

            # Garage
            garage = "rtsp://10.0.50.12:554/s0";
            garage_sub = "rtsp://10.0.50.12:554/s2";

            # Garten
            garten = "rtsp://10.0.50.14:554/s0";
            garten_sub = "rtsp://10.0.50.14:554/s2";

            # Hof
            hof = "rtsp://10.0.50.15:554/s0";
            hof_sub = "rtsp://10.0.50.15:554/s2";

            # Keller
            keller_a = "ffmpeg:rtsp://admin:\${FRIGATE_CAMERA_KELLER_PASSWORD}@10.0.50.60:554/${dahuaMainStream}";
            keller_a_sub = "ffmpeg:rtsp://admin:\${FRIGATE_CAMERA_KELLER_PASSWORD}@10.0.50.60:554/${dahuaSubStream}";

            # Schuppen
            schuppen = "rtsp://10.0.50.11:554/s0";
            schuppen_sub = "rtsp://10.0.50.11:554/s2";

            # Terrasse
            terrasse = "rtspx://10.0.0.1:7441/\${FRIGATE_CAMERA_TERRASSE_STREAM_MAIN}";
            terrasse_sub = "ffmpeg:terrasse#video=h264#audio=aac#width=1280#height=720#hardware=vaapi#raw=-fpsmax 5";

            # Waschkeller
            waschkeller = "rtsp://10.0.50.10:554/s0";
            waschkeller_sub = "rtsp://10.0.50.10:554/s2";
          };

        webrtc = {
          candidates = (builtins.map (ip: ip + ":8555") (ips.lan.xenon ++ ips.tailscale.xenon)) ++ [
            "${fqdn}:8555"
          ];

          filters.udp_ports = [
            webrtcRangeStart
            webrtcRangeEnd
          ];
        };
      };
    };

    caddy = {
      virtualHosts."${fqdn}" = {
        extraConfig = ''
          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          import tinyauth

          reverse_proxy ${internalIP}:${toString internalPort}
        '';
      };

      virtualHosts."${fqdnLocal}:5000" = {
        listenAddresses = ips.lan.xenon;
        extraConfig = ''
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
    '';

    interfaces =
      let
        sharedRules = {
          allowedTCPPorts = [
            1984
            8554
            8555
          ];
          allowedUDPPorts = [
            8554
            8555
          ];
          allowedUDPPortRanges = [
            {
              from = webrtcRangeStart;
              to = webrtcRangeEnd;
            }
          ];
        };
      in
      {
        "eth0" = sharedRules;
        "tailscale0" = sharedRules;
      };
  };

  virtualisation.quadlet.containers.tinyauth.containerConfig.environments = {
    TINYAUTH_AUTH_SESSIONEXPIRY = "604800";
    TINYAUTH_APPS_FRIGATE_CONFIG_DOMAIN = fqdn;
    TINYAUTH_APPS_FRIGATE_IP_BYPASS = lib.strings.concatStringsSep "," (
      ips.tailscale.gerdas-iphone
      ++ ips.tailscale.udos-iphone
      ++ ips.lan.gerdas-iphone
      ++ ips.lan.udos-iphone
    );
  };

  environment.systemPackages = with pkgs; [
    intel-gpu-tools
  ];
}
