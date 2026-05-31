{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    google-chrome
    onlyoffice-desktopeditors
    stremio-linux-shell
    telegram-desktop
  ];
}
