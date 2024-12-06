{
  age = {
    identityPaths = [ "/Users/daniel/.ssh/agenix" ];

    secrets = {
      nix-netrc = {
        file = ../all/nix/netrc.age;
        mode = "444";
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
