{ flake, ... }:
{
  imports = with flake.nixosModules; [
    _1password
    docker
    flatpak
    gnome
    gvfs
    ipfs
    location
    obs-studio
    ollama
    pipewire
    printing
    steam
    stylix
    udisks2
    userspace-packages
    vscode
  ];
}
