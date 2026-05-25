{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false; # remove once this is the default
    settings."*".forwardAgent = true;
  };
}
