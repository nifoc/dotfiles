{
  den.aspects.private-device = {
    homeManager =
      { pkgs, lib, ... }:
      {
        programs.ssh =
          let
            lan = name: localIP: {
              "Host ${name}" = {
                Port = 22;
                User = "daniel";
                ForwardAgent = true;
                IdentityFile = "~/.ssh/LAN.pub";
                IdentitiesOnly = true;
              };

              "Host ${name}-unlock" = {
                Hostname = localIP;
                Port = 2222;
                User = "root";
                IdentityFile = "~/.ssh/LAN.pub";
                IdentitiesOnly = true;
              };

              "${name}-match" = lib.hm.dag.entryAfter [ "Host ${name}" ] {
                header = "Match host ${name} exec \"nc -w 1 -z ${localIP} %p\"";
                Hostname = "${name}.lan";
              };

              "${name}-fallback" = lib.hm.dag.entryAfter [ "${name}-match" ] {
                header = "Match host ${name}";
                Hostname = "${name}.ts.kempkens.network";
              };
            };

            vps = name: remoteIP: {
              "Host ${name}" = {
                Hostname = "${name}.ts.kempkens.network";
                Port = 22;
                User = "daniel";
                IdentityFile = "~/.ssh/Hetzner.pub";
                IdentitiesOnly = true;
              };

              "Host ${name}-unlock" = {
                Hostname = remoteIP;
                Port = 2222;
                User = "root";
                IdentityFile = "~/.ssh/Hetzner.pub";
                IdentitiesOnly = true;
              };
            };
          in
          {
            settings = {
              "Host github.com" = {
                Port = 22;
                User = "git";
                IdentityFile = "~/.ssh/GitHub.pub";
                IdentitiesOnly = true;
                Compression = true;
              };

              "Host gitlab.com" = {
                Port = 22;
                User = "git";
                IdentityFile = "~/.ssh/GitLab.pub";
                IdentitiesOnly = true;
                Compression = true;
              };

              "Host git.kempkens.io" = {
                Port = 22;
                User = "forgejo";
                IdentityFile = "~/.ssh/GitHub.pub";
                IdentitiesOnly = true;
                Compression = true;
              };

              "Host router" = {
                Hostname = "10.0.0.1";
                Port = 22;
                User = "daniel";
                IdentityFile = "~/.ssh/LAN.pub";
                IdentitiesOnly = true;
                SetEnv = {
                  TERM = "xterm-256color";
                };
              };

              "Host adsb-antenna" = {
                Hostname = "adsb-antenna.laniot";
                Port = 22;
                User = "daniel";
                ForwardAgent = true;
                IdentityFile = "~/.ssh/LAN.pub";
                IdentitiesOnly = true;
              };
            }
            // (lan "argon" "10.0.0.5")
            // (lan "krypton" "10.0.0.100")
            // (lan "neon" "10.0.0.7")
            // (lan "xenon" "10.0.0.101")
            // (vps "boron" "138.199.219.102")
            // (vps "carbon" "49.12.228.29")
            // (vps "gallium" "51.89.118.129");
          };

        home.packages = with pkgs; [ netcat ];
      };
  };
}
