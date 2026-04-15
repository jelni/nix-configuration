{ flake, ... }:
{
  imports = with flake.nixosModules; [
    agenix
    base-packages
    doas
    fish
    git
    host-name
    lix
    nix
    openssh
    users
  ];
}
