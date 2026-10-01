{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false; # remove once this is the default
    settings."dreamweaver jel.gay".ForwardAgent = true;
  };
}
