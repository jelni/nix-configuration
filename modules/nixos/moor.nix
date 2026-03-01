{ pkgs, ... }:
{
  environment = {
    systemPackages = [ pkgs.moor ];
    variables.PAGER = "moor";
  };
}
