{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    google-chrome
    naps2
    onlyoffice-desktopeditors
    stremio-linux-shell
    telegram-desktop
  ];
}
