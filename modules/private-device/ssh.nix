{
  den.aspects.private-device = {
    homeManager = {
      programs.ssh = {
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
            User = "root";
            ForwardAgent = true;
            PreferredAuthentications = "keyboard-interactive";
            SetEnv = {
              TERM = "xterm-256color";
            };
          };

          "Host nas" = {
            Hostname = "10.0.0.100";
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

          "Host carbon" = {
            Hostname = "carbon.ts.kempkens.network";
            Port = 22;
            User = "daniel";
            ForwardAgent = true;
            IdentityFile = "~/.ssh/Hetzner.pub";
            IdentitiesOnly = true;
          };

          "Host carbon-unlock" = {
            Hostname = "49.12.228.29";
            Port = 2222;
            User = "root";
            IdentityFile = "~/.ssh/Hetzner.pub";
            IdentitiesOnly = true;
          };

          "Host boron" = {
            Hostname = "boron.ts.kempkens.network";
            Port = 22;
            User = "daniel";
            ForwardAgent = true;
            IdentityFile = "~/.ssh/Hetzner.pub";
            IdentitiesOnly = true;
          };

          "Host boron-unlock" = {
            Hostname = "138.199.219.102";
            Port = 2222;
            User = "root";
            IdentityFile = "~/.ssh/Hetzner.pub";
            IdentitiesOnly = true;
          };

          "Host gallium" = {
            Hostname = "51.89.118.129";
            Port = 22;
            User = "daniel";
            ForwardAgent = true;
            IdentityFile = "~/.ssh/Hetzner.pub";
            IdentitiesOnly = true;
          };

          "Host gallium-unlock" = {
            Hostname = "51.89.118.129";
            Port = 2222;
            User = "root";
            IdentityFile = "~/.ssh/Hetzner.pub";
            IdentitiesOnly = true;
          };

          "Host krypton" = {
            Hostname = "krypton.ts.kempkens.network";
            Port = 22;
            User = "daniel";
            ForwardAgent = true;
            IdentityFile = "~/.ssh/LAN.pub";
            IdentitiesOnly = true;
          };

          "Host krypton-unlock" = {
            Hostname = "10.0.0.100";
            Port = 2222;
            User = "root";
            IdentityFile = "~/.ssh/LAN.pub";
            IdentitiesOnly = true;
          };

          "Host xenon" = {
            Hostname = "xenon.ts.kempkens.network";
            Port = 22;
            User = "daniel";
            ForwardAgent = true;
            IdentityFile = "~/.ssh/LAN.pub";
            IdentitiesOnly = true;
          };

          "Host xenon-unlock" = {
            Hostname = "10.0.0.101";
            Port = 2222;
            User = "root";
            IdentityFile = "~/.ssh/LAN.pub";
            IdentitiesOnly = true;
          };

          "Host argon" = {
            Hostname = "argon.ts.kempkens.network";
            Port = 22;
            User = "daniel";
            ForwardAgent = true;
            IdentityFile = "~/.ssh/LAN.pub";
            IdentitiesOnly = true;
          };

          "Host argon-unlock" = {
            Hostname = "10.0.0.5";
            Port = 2222;
            User = "root";
            IdentityFile = "~/.ssh/LAN.pub";
            IdentitiesOnly = true;
          };

          "Host neon" = {
            Hostname = "neon.ts.kempkens.network";
            Port = 22;
            User = "daniel";
            ForwardAgent = true;
            IdentityFile = "~/.ssh/LAN.pub";
            IdentitiesOnly = true;
          };

          "Host neon-unlock" = {
            Hostname = "10.0.0.7";
            Port = 2222;
            User = "root";
            IdentityFile = "~/.ssh/LAN.pub";
            IdentitiesOnly = true;
          };
        };
      };
    };
  };
}
