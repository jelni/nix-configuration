{ flake, ... }:
{
  imports = with flake.nixosModules; [
    agenix
    base-packages
    doas
    documentation
    fish
    git
    host-name
    immutable-users
    lix
    nix
    openssh
  ];
}
