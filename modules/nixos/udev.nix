{ pkgs, ... }:
{
  services.udev.packages = [ pkgs.libgphoto2 ];
}
