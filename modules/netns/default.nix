{
  den.aspects.netns = {
    nixos =
      { pkgs, lib, ... }:
      {
        systemd.services."netns@" = {
          description = "%I network namespace";
          before = [ "network.target" ];
          serviceConfig =
            let
              ip = lib.getExe' pkgs.iproute2 "ip";
            in
            {
              Type = "oneshot";
              RemainAfterExit = true;
              ExecStart = "${ip} netns add %I";
              ExecStop = "${ip} netns del %I";
            };
        };
      };
  };
}
