{ pkgs, ... }:
{
  environment = {
    shellAliases.wget = "wget2";
    systemPackages = [ pkgs.wget2 ];
  };
}
