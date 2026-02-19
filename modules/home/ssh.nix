{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false; # remove once this is the default
    matchBlocks."*".identityAgent = "~/.1password/agent.sock";
  };
}
