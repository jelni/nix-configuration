{ flake, ... }:
{
  imports = with flake.homeModules; [
    bitwarden
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
    telegram-desktop
    udiskie
    vesktop
    vscodium
    xdg
    yt-dlp
    zed
  ];
}
