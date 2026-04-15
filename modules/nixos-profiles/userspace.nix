{ flake, ... }:
{
  imports = with flake.nixosModules; [
    _1password
    docker
    flatpak
    gnome
    gvfs
    halloy
    location
    nautilus-open-any-terminal
    obs-studio
    ollama
    pipewire
    printing
    srvos-userspace
    steam
    udisks2
    user-guest
    userspace-packages
    vscode
  ];
}
