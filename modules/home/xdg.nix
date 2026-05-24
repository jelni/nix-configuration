{ perSystem, pkgs, ... }:
{
  xdg = {
    enable = true;
    autostart.enable = true;

    mimeApps = {
      enable = true;

      defaultApplicationPackages = with pkgs; [
        zed-editor
        telegram-desktop
        tutanota-desktop
        perSystem.firefox.firefox-nightly-bin
        onlyoffice-desktopeditors
        loupe
        mpv
        file-roller
      ];
    };
  };
}
