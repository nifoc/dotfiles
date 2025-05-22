{
  pkgs,
  lib,
  config,
  ...
}:

{
  services.nginx = {
    package = lib.mkForce (
      pkgs.nginxQuic.override {
        withKTLS = true;
        withImageFilter = true;
      }
    );

    additionalModules = with pkgs.nginxModules; [
      vod
    ];

    appendHttpConfig = ''
      aio on;

      vod_mode                           local;
      vod_metadata_cache                 metadata_cache 16m;
      vod_response_cache                 response_cache 512m;
      vod_last_modified_types            *;
      vod_segment_duration               9000;
      vod_align_segments_to_key_frames   on;
      vod_dash_fragment_file_name_prefix "segment";
      vod_hls_segment_file_name_prefix   "segment";

      vod_manifest_segment_durations_mode accurate;
    '';

    virtualHosts."default.internal.kempkens.network" = {
      listen = [
        {
          addr = "0.0.0.0";
          port = 443;
          ssl = true;
          extraParameters = [
            "fastopen=63"
            "backlog=1023"
            "deferred"
          ];
        }

        {
          addr = "[::0]";
          port = 443;
          ssl = true;
          extraParameters = [
            "fastopen=63"
            "backlog=1023"
            "deferred"
          ];
        }
      ];

      default = true;
      quic = false;

      onlySSL = true;
      useACMEHost = "internal.kempkens.network";

      locations."/" = {
        return = "418";
      };
    };
  };

  networking.firewall.interfaces =
    let
      interfaces =
        lib.mapAttrsToList (
          _: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null
        ) config.systemd.network.networks
        ++ [ "tailscale0" ];
    in
    builtins.listToAttrs (
      builtins.map (iface: {
        name = iface;
        value = {
          allowedTCPPorts = [
            80
            443
          ];
          allowedUDPPorts = [ 443 ];
        };
      }) (builtins.filter builtins.isString interfaces)
    );
}
