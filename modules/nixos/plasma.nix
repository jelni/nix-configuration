{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.aha ];

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
    xserver.enable = true;
  };
}
