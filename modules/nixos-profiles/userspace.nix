{ flake, ... }:
{
  imports = with flake.nixosModules; [
    _1password
    docker
    flatpak
    gnome
    gvfs
    halloy
    ipfs
    location
    obs-studio
    ollama
    pipewire
    printing
    srvos-userspace
    steam
    stylix
    udisks2
    userspace-packages
    vscode
  ];
}
