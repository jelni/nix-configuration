{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false; # remove once this is the default
    matchBlocks."*".forwardAgent = true;
  };
}
