{ pkgs, ... }:
{
  programs.gnome-shell = {
    enable = true;

    extensions = map (package: { inherit package; }) (
      with pkgs.gnomeExtensions;
      [
        auto-move-windows
        caffeine
        clipboard-indicator
        launch-new-instance
        removable-drive-menu
        status-icons
        steal-my-focus-window
        system-monitor
        wallpaper-slideshow
      ]
    );
  };
}
