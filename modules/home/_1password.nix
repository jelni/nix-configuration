{ ... }:
{
  programs = {
    jujutsu.settings.signing.backends.ssh.program = "op-ssh-sign";
    ssh.matchBlocks."*".identityAgent = "~/.1password/agent.sock";
  };
}
