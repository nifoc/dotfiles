{
  age = {
    identityPaths = [ "/Users/dkempkens/.ssh/agenix" ];

    secrets = {
      nix-netrc = {
        file = ../all/nix/netrc.age;
        path = "/etc/nix/netrc";
        mode = "444";
        symlink = false;
      };

      attic-config = {
        file = ../all/attic/config.age;
        path = "/Users/dkempkens/.config/attic/config.toml";
        mode = "600";
        owner = "dkempkens";
        group = "staff";
      };

      git-maintenance = {
        file = ./git/maintenance.age;
        path = "/Users/dkempkens/.config/git/maintenance-config";
        owner = "dkempkens";
        group = "staff";
      };
    };
  };
}
