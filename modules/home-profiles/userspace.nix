{ flake, ... }:
{
  imports = with flake.homeModules; [
    _1password
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
