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
