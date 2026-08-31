{ den, ... }:

{
  den.aspects.ntp = {
    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        ntpConfig = (den.aspects.${config.networking.hostName}.meta.ntp or { });
        hasRTC = (ntpConfig.rtc or true);
      in
      {
        services.chrony = {
          enable = true;

          extraFlags = [
            "-F 1"
            "-r"
          ];

          enableRTCTrimming = false;
          initstepslew.enabled = false;

          servers = [
            "time.cloudflare.com"
            "ntppool1.time.nl"
            "nts.netnod.se"
            "ptbtime1.ptb.de"
            "time.dfm.dk"
            "time.cifelli.xyz"
            "ntp3.ipv6.fau.de"
            "nts.teambelgium.net"
          ];

          serverOption = "iburst";
          enableNTS = true;

          extraConfig = ''
            nocerttimecheck 1

            minsources 3
            authselectmode require

            dscp 46

            leapseclist ${pkgs.tzdata}/share/zoneinfo/leap-seconds.list
            makestep 1.0 3
          ''
          + lib.strings.optionalString hasRTC ''
            rtcsync
          '';
        };
      };
  };
}
