{ flake, ... }:
{
  imports = with flake.homeModules; [
    aria2
    bat
    bottom
    claude-code
    delta
    direnv
    eza
    firefox
    fish
    gcc
    ghostty
    github
    gnome
    halloy
    helix
    home-manager
    htop
    jujutsu
    mpv
    mullvad-vpn
    nushell
    ripgrep
    ssh
    stylix
    udiskie
    uv
    vesktop
    vscode
    xdg
    yt-dlp
    zed
  ];

  home.stateVersion = "25.05";
}
