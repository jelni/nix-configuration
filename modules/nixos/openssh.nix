{
  security.pam.sshAgentAuth.enable = true;

  services.openssh = {
    enable = true;

    settings = {
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
