{ flake, ... }:
{
  imports = with flake.nixosModules; [
    _1password
    dhcpcd
    flatpak
    gnome
    gvfs
    halloy
    location
    nautilus-open-any-terminal
    obs-studio
    ollama
    pipewire
    podman
    printing
    srvos-userspace
    steam
    udev
    udisks2
    user-guest
    userspace-packages
    vscode
  ];
}
