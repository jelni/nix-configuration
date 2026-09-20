{ flake, ... }:
{
  imports = with flake.nixosModules; [
    dreamweaver-nfs-mount
    flatpak
    fonts
    gnome
    halloy
    nautilus-open-any-terminal
    obs-studio
    ollama
    plymouth-hackerspace-zyrardow
    podman
    steam
    user-guest
    userspace-packages
    vesktop
    vscode
  ];
}
