{
  den.aspects.remote-access = {
    nixos = {
      services.openssh = {
        enable = true;
        startWhenNeeded = true;

        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "prohibit-password";
        };
      };

      systemd.sockets.sshd = {
        socketConfig = {
          SocketProtocol = "mptcp";
        };
      };
    };
  };
}
