{ pkgs, ... }:
{
  programs.gnome-shell = {
    enable = true;

    extensions = with pkgs.gnomeExtensions; [
      { package = auto-move-windows; }
      { package = clipboard-indicator; }
      { package = launch-new-instance; }
      { package = removable-drive-menu; }
      { package = status-icons; }
      { package = steal-my-focus-window; }
      { package = system-monitor; }
      { package = wallpaper-slideshow; }
    ];
  };

  xdg.cacheFile."clipboard-indicator@tudmotu.com/registry.txt".text = builtins.toJSON (
    map
      (contents: {
        favorite = true;
        mimetype = "text/plain;charset=utf-8";
        inherit contents;
      })
      [
        "…"
        "„”"
        "–"
        "—"
        "»"
      ]
  );
}
