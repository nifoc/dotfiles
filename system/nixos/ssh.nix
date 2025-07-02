{ pkgs, ... }:

{
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

  environment.systemPackages = with pkgs; [ wezterm.terminfo ];
}
