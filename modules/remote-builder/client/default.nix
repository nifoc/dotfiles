{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.remote-builder.provides.client = {
    darwin = {
      imports = [ inputs.agenix.darwinModules.default ];

      age.secrets = {
        nix-id_nix_remote_builder = {
          file = ../../../agenix/remote-builder/client/id_nix_remote_builder.age;
          path = "/etc/nix/id_nix_remote_builder";
          mode = "600";
          owner = "root";
          group = "wheel";
          symlink = false;
        };
      };

      nix = {
        distributedBuilds = true;

        buildMachines = [
          {
            hostName = "boron.ts.kempkens.network";
            protocol = "ssh-ng";
            systems = [ "x86_64-linux" ];
            mandatoryFeatures = [ ];
            supportedFeatures = [
              "benchmark"
              "big-parallel"
            ];
            sshUser = "nix-remote-builder";
            sshKey = "/etc/nix/id_nix_remote_builder";
            maxJobs = 2;
            speedFactor = 1;
          }

          {
            hostName = "carbon.ts.kempkens.network";
            protocol = "ssh-ng";
            systems = [ "aarch64-linux" ];
            mandatoryFeatures = [ ];
            supportedFeatures = [
              "benchmark"
              "big-parallel"
            ];
            sshUser = "nix-remote-builder";
            sshKey = "/etc/nix/id_nix_remote_builder";
            maxJobs = 2;
            speedFactor = 1;
          }
        ];
      };

      environment.etc."ssh/ssh_config.d/100-nix-remote-builder.conf".text = ''
        Host carbon.ts.kempkens.network
          User nix-remote-builder
          Port 22
          IdentityFile /etc/nix/id_nix_remote_builder
          StrictHostKeyChecking accept-new
          ControlMaster auto
          ControlPath /tmp/ssh-%r@%h:%p
          ControlPersist 120

        Host boron.ts.kempkens.network
          User nix-remote-builder
          Port 22
          IdentityFile /etc/nix/id_nix_remote_builder
          StrictHostKeyChecking accept-new
          ControlMaster auto
          ControlPath /tmp/ssh-%r@%h:%p
          ControlPersist 120
      '';
    };
  };
}
