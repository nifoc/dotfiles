{
  age = {
    identityPaths = [ "/Users/daniel/.ssh/agenix" ];

    secrets = {
      nix-netrc = {
        file = ../all/nix/netrc.age;
        path = "/etc/nix/netrc";
        mode = "444";
      };
    };
  };
}
