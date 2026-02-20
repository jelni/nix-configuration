{ flake, inputs, ... }:
{
  imports = with flake.nixosModules; [
    inputs.agenix.nixosModules.default
    inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    inputs.stylix.nixosModules.stylix

    _1password
    agenix
    boot
    dns
    doas
    docker
    firewall
    fish
    flatpak
    fwupd
    git
    gnome
    gvfs
    hardware
    host-name
    ipfs
    limine
    lix
    location
    moor
    networkmanager
    nix
    nix-ld
    ntp
    obs-studio
    ollama
    openssh
    pipewire
    plymouth
    postgresql
    power-management
    printing
    safe-rm
    snowflake-proxy
    steam
    stylix
    system-packages
    udisks2
    users
    vscode
    wget2
    xserver
    zfs
  ];

  networking.hostId = "d0eca1a0";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
