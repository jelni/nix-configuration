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
    jujutsu-signing
    mpv
    mullvad-vpn
    nushell
    udiskie
    vesktop
    vscode
    xdg
    yt-dlp
    zed
  ];
}
