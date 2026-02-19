{ perSystem, pkgs, ... }:
{
  xdg = {
    enable = true;

    autostart = {
      enable = true;

      entries = [
        "${pkgs.telegram-desktop}/share/applications/org.telegram.desktop.desktop"
        "${pkgs.vesktop}/share/applications/vesktop.desktop"
      ];
    };

    configFile."autostart/1password.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=1Password
      Exec=1password --silent %U
    '';

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
        qbittorrent
      ];
    };
  };
}
