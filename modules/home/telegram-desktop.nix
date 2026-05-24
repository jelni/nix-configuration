{ pkgs, ... }:
{
  xdg.autostart.entries = [
    "${pkgs.telegram-desktop}/share/applications/org.telegram.desktop.desktop"
  ];
}
