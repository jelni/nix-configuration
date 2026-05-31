{ flake, ... }:
{
  imports = with flake.nixosModules; [
    _1password
    flatpak
    gnome
    halloy
    nautilus-open-any-terminal
    obs-studio
    ollama
    podman
    steam
    user-guest
    userspace-packages
    vscode
  ];
}
