{
  den.aspects.bitwarden.provides.macos = {
    homeManager =
      { config, ... }:
      let
        authSocket = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
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
