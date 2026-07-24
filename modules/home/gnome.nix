{ pkgs, ... }:
{
  programs.gnome-shell = {
    enable = true;

    extensions = map (package: { inherit package; }) (
      with pkgs.gnomeExtensions;
      [
        appindicator
        auto-move-windows
        caffeine
        clipboard-indicator
        launch-new-instance
        removable-drive-menu
        steal-my-focus-window
        system-monitor
        wallpaper-slideshow
      ]
    );
  };
}
