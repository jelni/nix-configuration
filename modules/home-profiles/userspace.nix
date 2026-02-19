{ flake, ... }:
{
  imports = with flake.homeModules; [
    claude-code
    firefox
    ghostty
    gnome
    halloy
    helix
    mpv
    mullvad-vpn
    nushell
    stylix
    udiskie
    vesktop
    vscode
    xdg
    yt-dlp
    zed
  ];
}
