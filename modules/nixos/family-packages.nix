{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    google-chrome
    kdePackages.dragon
    naps2
    onlyoffice-desktopeditors
    stremio-linux-shell
    telegram-desktop
  ];
}
