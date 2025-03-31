{
  age = {
    identityPaths = [ "/Users/daniel/.ssh/agenix" ];

    secrets = {
      nix-netrc = {
        file = ../all/nix/netrc.age;
        path = "/etc/nix/netrc";
        mode = "444";
        symlink = false;
      };

      nix-id_nix_remote_builder = {
        file = ../all/nix/id_nix_remote_builder.age;
        path = "/etc/nix/id_nix_remote_builder";
        mode = "600";
        owner = "root";
        group = "wheel";
        symlink = false;
      };

      attic-config = {
        file = ../all/attic/config.age;
        path = "/Users/daniel/.config/attic/config.toml";
        mode = "600";
        owner = "daniel";
        group = "staff";
      };

      git-maintenance = {
        file = ./git/maintenance.age;
        path = "/Users/daniel/.config/git/maintenance-config";
        owner = "daniel";
        group = "staff";
      };
    };
  };
}
