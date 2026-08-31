{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    disko.url = "github:nix-community/disko";
  };

  den.aspects.frigate = {
    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;

        fqdn = "frigate.internal.kempkens.network";
        internalIP = "127.0.0.1";
        internalPort = 8080;
        webrtcRangeStart = 50000;
        webrtcRangeEnd = 50500;

        ffmpegPkg = pkgs.ffmpeg_7-full;

        frigateEnvRefs =
          url:
          if builtins.typeOf url == "list" then
            builtins.map frigateEnvRefs url
          else
            builtins.replaceStrings [ "\${" ] [ "{" ] url;

      in
      {
        imports = [
          inputs.agenix.nixosModules.default
          inputs.disko.nixosModules.disko
        ];

        age.secrets = {
          frigate-environment = {
            file = ../../agenix/frigate/environment.age;
          };
        };

        disko.devices.zpool.zroot.datasets = {
          "root/services/frigate" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/frigate";
              atime = "off";
            };
            mountpoint = "/var/lib/frigate";
          };
        };

        services = {
          frigate = {
            enable = true;

            # package = pkgs.master.frigate;

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
                path = "plus://19e725aa90b9063fdce57fdcd7132ee5";
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
                einfahrt_a = {
                  enabled = true;
                  type = "generic";
                  webui_url = "http://10.0.50.19";

                  ui = {
                    order = 0;
                    dashboard = true;
                  };

                  ffmpeg = {
                    inputs = [
                      {
                        path = "rtsp://127.0.0.1:8554/einfahrt_a";
                        input_args = "preset-rtsp-restream";
                        roles = [ "record" ];
                      }

                      {
                        path = "rtsp://127.0.0.1:8554/einfahrt_a_sub";
                        input_args = "preset-rtsp-restream";
                        roles = [ "detect" ];
                      }
                    ];

                    output_args = {
                      record = "preset-record-generic-audio-aac";
                    };
                  };

                  detect = {
                    enabled = true;
                    fps = 8;
                  };

                  motion = {
                    threshold = 30;
                    contour_area = 10;

                    mask = [
                      # Date & Time
                      "0,0.044,0.271,0.044,0.269,0,0,0"
                      # House
                      "0.904,0,0.89,0.504,0.787,1,1,1,1,0"
                      # Bushes
                      "0.002,0.504,0.709,0.128,0.712,0.084,0.903,0.118,0.907,0,0,0"
                    ];
                  };

                  objects = {
                    track = [
                      "person"
                      "dog"
                      "cat"
                      "horse"
                      "car"
                      "motorcycle"
                      "bicycle"
                      "bus"
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

                  ui = {
                    order = 2;
                    dashboard = true;
                  };

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
                        roles = [ "detect" ];
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
                    threshold = 40;
                    contour_area = 20;

                    mask = [
                      # Date & Time
                      "0,0.039,0.17,0.039,0.171,0,0,0"
                      # House
                      "0.276,1,0,1,0,0.033,0.165,0.033,0.168,0,0.298,0,0.392,0.28,0.202,0.455"
                      # Gutter
                      "1,0.043,0.367,0.225,0.291,0,1,0"
                      # Other Parking
                      "0.915,0.177,1,0.175,1,0,0.914,0"
                    ];
                  };

                  zones = {
                    eingang_weg = {
                      friendly_name = "Eingang Weg";
                      coordinates = "0.26,0.687,0.364,0.598,0.579,1,0.351,1";
                      inertia = 3;
                      objects = [ "person" ];
                    };
                  };

                  objects = {
                    track = [
                      "person"
                      "dog"
                      "cat"
                      "horse"
                      "car"
                      "motorcycle"
                      "bicycle"
                      "bus"
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

                    mask = [
                      # Other Parking
                      "0.915,0.177,1,0.175,1,0,0.914,0"
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

                flur_unten_a = {
                  enabled = true;
                  type = "generic";

                  ui = {
                    order = 8;
                    dashboard = true;
                  };

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
                  webui_url = "http://10.0.50.16";

                  ui = {
                    order = 6;
                    dashboard = true;
                  };

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
                        roles = [ "detect" ];
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

                  motion = {
                    threshold = 60;
                    contour_area = 50;

                    mask = [
                      # Date & Time
                      "0.001,0.035,0.158,0.035,0.158,0,0,0"
                      # Wall
                      "0,0.713,0.33,0.231,0.34,0.1,0.697,0.082,0.699,0.159,1,0.629,1,0,0,0"
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

                  ui = {
                    order = 5;
                    dashboard = true;
                  };

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
                        roles = [ "detect" ];
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

                  motion = {
                    threshold = 60;
                    contour_area = 50;

                    mask = [
                      # Date & Time
                      "0.001,0.035,0.158,0.035,0.158,0,0,0"
                      # Tree
                      "0.227,0.995,0.248,0.43,0.194,0.032,0,0.033,0,1"
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

                haustuer = {
                  enabled = true;
                  type = "generic";
                  webui_url = "http://10.0.50.62";

                  ui = {
                    order = 1;
                    dashboard = true;
                  };

                  ffmpeg = {
                    inputs = [
                      {
                        path = "rtsp://127.0.0.1:8554/haustuer";
                        input_args = "preset-rtsp-restream";
                        roles = [ "record" ];
                      }

                      {
                        path = "rtsp://127.0.0.1:8554/haustuer_sub";
                        input_args = "preset-rtsp-restream";
                        roles = [ "detect" ];
                      }
                    ];

                    output_args = {
                      record = "preset-record-generic-audio-aac";
                    };
                  };

                  live = {
                    streams = {
                      "Kein Lautsprecher" = "haustuer";
                      "Lautsprecher" = "haustuer_2way";
                    };
                  };

                  detect = {
                    enabled = true;
                    fps = 7;
                  };

                  motion = {
                    threshold = 40;
                    contour_area = 20;

                    mask = [
                      # Date & Time
                      "0,0.039,0.409,0.039,0.408,0,0,0"
                      # Sky
                      "0,0.353,0.553,0.161,0.474,0,0,0"
                    ];
                  };

                  zones = {
                    eingang_weg = {
                      friendly_name = "Eingang Weg";
                      coordinates = "0.507,0.608,0,0.858,0,1,0.629,1,0.646,0.92,0.501,0.904";
                      inertia = 3;
                      objects = [ "person" ];
                    };
                  };

                  objects = {
                    track = [
                      "person"
                      "face"
                      "package"
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

                heizungskeller = {
                  enabled = true;
                  type = "generic";

                  ui = {
                    order = 11;
                    dashboard = true;
                  };

                  ffmpeg = {
                    inputs = [
                      {
                        path = "rtsp://127.0.0.1:8554/heizungskeller";
                        input_args = "preset-rtsp-restream";
                        roles = [ "record" ];
                      }

                      {
                        path = "rtsp://127.0.0.1:8554/heizungskeller";
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
                      # Wall
                      "0,0.685,0,1,0.152,1"
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

                hof = {
                  enabled = true;
                  type = "generic";
                  webui_url = "http://10.0.50.15";

                  ui = {
                    order = 3;
                    dashboard = true;
                  };

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
                        roles = [ "detect" ];
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
                    threshold = 40;
                    contour_area = 20;

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

                  lpr = {
                    enabled = true;
                    enhancement = 3;
                  };

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

                kellerausgang = {
                  enabled = true;
                  type = "generic";
                  webui_url = "http://10.0.50.11";

                  ui = {
                    order = 10;
                    dashboard = true;
                  };

                  ffmpeg = {
                    inputs = [
                      {
                        path = "rtsp://127.0.0.1:8554/kellerausgang";
                        input_args = "preset-rtsp-restream";
                        roles = [ "record" ];
                      }

                      {
                        path = "rtsp://127.0.0.1:8554/kellerausgang_sub";
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
                    threshold = 75;
                    contour_area = 50;

                    mask = [
                      # Date & Time
                      "0.001,0.035,0.158,0.035,0.158,0,0,0"
                      # Wall
                      "0.755,0.102,0.755,0,0.155,0,0.15,0.036,0,0.033,0,1,0.268,1,0.239,0.596,0.146,0.575,0.149,0.34,0.211,0.299,0.208,0.049"
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

                schuppen_a = {
                  enabled = true;
                  type = "generic";
                  webui_url = "http://10.0.50.18";

                  ui = {
                    order = 7;
                    dashboard = true;
                  };

                  ffmpeg = {
                    inputs = [
                      {
                        path = "rtsp://127.0.0.1:8554/schuppen_a";
                        input_args = "preset-rtsp-restream";
                        roles = [ "record" ];
                      }

                      {
                        path = "rtsp://127.0.0.1:8554/schuppen_a_sub";
                        input_args = "preset-rtsp-restream";
                        roles = [ "detect" ];
                      }
                    ];

                    output_args = {
                      record = "preset-record-generic-audio-aac";
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

                  motion = {
                    threshold = 40;
                    contour_area = 30;

                    mask = [
                      # Date & Time
                      "0,0.054,0.346,0.054,0.346,0,0,0"
                      # Bushes and Sky
                      "0,0.338,0.067,0.338,0.284,0.187,0.32,0.187,0.328,0.072,0.708,0.128,1,0.355,1,0,0.341,0,0.341,0.049,0,0.051"
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
                  webui_url = "http://10.0.50.17";

                  ui = {
                    order = 4;
                    dashboard = true;
                  };

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
                        roles = [ "detect" ];
                      }
                    ];

                    output_args = {
                      record = "preset-record-generic-audio-aac";
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
                      "0,0.044,0.271,0.044,0.269,0,0,0"
                      # Roof
                      "0,1,0.041,0.379,0.053,0.138,0.593,0.121,0.597,0.167,0.629,0.167,0.626,0.113,1,0.271,1,0,0.265,0,0.265,0.044,0,0.039"
                    ];
                  };

                  objects = {
                    track = [
                      "person"
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

                  ui = {
                    order = 9;
                    dashboard = true;
                  };

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
                        roles = [ "detect" ];
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

                  motion = {
                    threshold = 75;
                    contour_area = 50;

                    mask = [
                      # Date & Time
                      "0.001,0.035,0.158,0.035,0.158,0,0,0"
                      # Ceiling
                      "0,0.159,0.031,0.043,1,0.11,1,0,0.15,0,0.149,0.031,0,0.031"
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
              face_recognition.enabled = false;

              lpr = {
                enabled = true;
                model_size = "small";
                recognition_threshold = 0.85;

                replace_rules = [
                  {
                    pattern = "[= ]";
                    replacement = "-";
                  }
                ];
              };

              classification = {
                custom = {
                  Waescheleine = {
                    enabled = true;
                    name = "Waescheleine";
                    threshold = 0.8;
                    state_config = {
                      cameras = {
                        garten = {
                          crop = [
                            0.6017759631388487
                            0.15482537216263975
                            0.6998407762024477
                            0.32916281760903787
                          ];
                        };
                      };

                      motion = true;
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
              ffmpeg = {
                bin = lib.getExe ffmpegPkg;
                volume = "-af \"volume=30dB\"";
              };

              streams =
                let
                  dahuaMainStream = "cam/realmonitor?channel=1&subtype=0";
                  dahuaSubStream = "cam/realmonitor?channel=1&subtype=1";

                  hikvisionMainStream = "Streaming/channels/101";
                  hikvisionSubStream = "Streaming/channels/102";
                in
                {
                  # Einfahrt
                  einfahrt_a = "rtsp://admin:\${FRIGATE_CAMERA_EINFAHRT_PASSWORD}@10.0.50.19:554/${hikvisionMainStream}";
                  einfahrt_a_sub = "rtsp://admin:\${FRIGATE_CAMERA_EINFAHRT_PASSWORD}@10.0.50.19:554/${hikvisionSubStream}";

                  # Eingang
                  eingang = "rtsp://10.0.50.13:554/s0";
                  eingang_sub = "rtsp://10.0.50.13:554/s2";

                  # Flur Unten
                  flur_unten_a = "ffmpeg:rtsp://admin:\${FRIGATE_CAMERA_FLUR_UNTEN_PASSWORD}@10.0.50.61:554/${dahuaMainStream}";
                  flur_unten_a_sub = "ffmpeg:rtsp://admin:\${FRIGATE_CAMERA_FLUR_UNTEN_PASSWORD}@10.0.50.61:554/${dahuaSubStream}";

                  # Garage
                  garage = "rtsp://10.0.50.16:554/s0";
                  garage_sub = "rtsp://10.0.50.16:554/s2";

                  # Garten
                  garten = "rtsp://10.0.50.14:554/s0";
                  garten_sub = "rtsp://10.0.50.14:554/s2";

                  # Haustür
                  haustuer = "rtsp://127.0.0.1:10554/doorbell/stream_main";
                  haustuer_sub = "rtsp://127.0.0.1:10554/doorbell/stream_sub";
                  haustuer_2way = [
                    "rtsp://127.0.0.1:8554/haustuer"
                    "rtsp://127.0.0.1:10554/doorbell/stream_sub_twoway"
                  ];

                  # Heizungskeller
                  heizungskeller = "ffmpeg:rtsp://admin:\${FRIGATE_CAMERA_KELLER_PASSWORD}@10.0.50.60:554/${dahuaMainStream}";
                  heizungskeller_sub = "ffmpeg:rtsp://admin:\${FRIGATE_CAMERA_KELLER_PASSWORD}@10.0.50.60:554/${dahuaSubStream}";

                  # Hof
                  hof = "rtsp://10.0.50.15:554/s0";
                  hof_sub = "rtsp://10.0.50.15:554/s2";

                  # Schuppen
                  schuppen_a = "rtsp://admin:\${FRIGATE_CAMERA_SCHUPPEN_PASSWORD}@10.0.50.18:554/${dahuaMainStream}";
                  schuppen_a_sub = "rtsp://admin:\${FRIGATE_CAMERA_SCHUPPEN_PASSWORD}@10.0.50.18:554/${dahuaSubStream}";

                  # Kellerausgang
                  kellerausgang = "rtsp://10.0.50.11:554/s0";
                  kellerausgang_sub = "rtsp://10.0.50.11:554/s2";

                  # Terrasse
                  terrasse = "rtsp://admin:\${FRIGATE_CAMERA_TERRASSE_PASSWORD}@10.0.50.17:554/${hikvisionMainStream}";
                  terrasse_sub = "rtsp://admin:\${FRIGATE_CAMERA_TERRASSE_PASSWORD}@10.0.50.17:554/${hikvisionSubStream}";

                  # Waschkeller
                  waschkeller = "rtsp://10.0.50.10:554/s0";
                  waschkeller_sub = "rtsp://10.0.50.10:554/s2";
                };

              webrtc = {
                candidates =
                  (builtins.map (ip: ip + ":8555") (
                    [ networkConfig.default.ipv4 ]
                    ++ [
                      networkConfig.tailscale.ipv4
                      networkConfig.tailscale.ipv6
                    ]
                  ))
                  ++ [
                    "stun:8555"
                  ];

                filters.udp_ports = [
                  webrtcRangeStart
                  webrtcRangeEnd
                ];
              };

              api = {
                origin = "*";
              };
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

            serviceConfig = {
              EnvironmentFile = config.age.secrets.frigate-environment.path;
              TimeoutStopSec = 30;
            };
          };

          go2rtc = {
            restartTriggers = [
              "${config.age.secrets.frigate-environment.file}"
            ];

            serviceConfig.EnvironmentFile = config.age.secrets.frigate-environment.path;
          };
        };

        networking.firewall.interfaces =
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
            "${networkConfig.default.name}" = sharedRules;
            "${networkConfig.tailscale.name}" = sharedRules;
          };
      };
  };
}
