{ den, ... }:

{
  den.aspects.cli = {
    homeManager =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        programs.ssh = {
          enable = true;
          enableDefaultConfig = false;

          settings = {
            "Host *" = {
              ForwardAgent = false;
              AddKeysToAgent = "no";
              Compression = false;
              HashKnownHosts = true;
              VerifyHostKeyDNS = true;
              ServerAliveInterval = 60;
              ServerAliveCountMax = 3;
              UserKnownHostsFile = "~/.ssh/known_hosts";
              ControlMaster = "no";
              ControlPath = "~/.ssh/master-%r@%n:%p";
              ControlPersist = "no";
            };
          };
        };

        home =
          let
            directory = "${config.home.homeDirectory}/.ssh";
            keys = den.aspects.${config.home.username}.meta.sshKeys;
          in
          {
            packages = [ pkgs.openssh ];

            file = lib.mapAttrs' (k: v: {
              name = "${directory}/${k}.pub";
              value = {
                text = v;
              };
            }) keys;
          };
      };
  };
}
