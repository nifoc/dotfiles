{
  den.aspects.onepassword.provides.macos = {
    homeManager =
      { config, ... }:
      let
        authSocket = "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
      in
      {
        programs.ssh.settings = {
          "Host *" = {
            IdentityAgent = authSocket;
          };
        };

        home.sessionVariables.SSH_AUTH_SOCK = "${authSocket}";

        launchd.agents.SSH_AUTH_SOCK = {
          enable = true;
          config = {
            ProgramArguments = [
              "/bin/sh"
              "-c"
              "/bin/ln -sf \"${authSocket}\" $SSH_AUTH_SOCK"
            ];
            RunAtLoad = true;
          };
        };
      };
  };
}
