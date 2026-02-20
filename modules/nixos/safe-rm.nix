{ pkgs, ... }:
{
  environment = {
    shellAliases.rm = "safe-rm";
    systemPackages = [ pkgs.safe-rm ];
  };
}
