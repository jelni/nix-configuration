{
  programs = {
    jujutsu.settings.signing.backends.ssh.program = "op-ssh-sign";
    ssh.matchBlocks."*".identityAgent = "~/.1password/agent.sock";
  };

  xdg.configFile."autostart/1password.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=1Password
    Exec=1password --silent %U
  '';
}
