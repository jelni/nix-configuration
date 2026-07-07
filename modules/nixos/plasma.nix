{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.aha ];
  hardware.bluetooth.enable = true;
  networking.networkmanager.enable = true;

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
    xserver.enable = true;
  };
}
