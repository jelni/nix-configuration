{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.smartmontools ];
}
