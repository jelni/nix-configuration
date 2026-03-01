{ flake, ... }:
{
  imports = with flake.nixosModules; [
    agenix
    doas
    fish
    git
    host-name
    lix
    moor
    nix
    nix-ld
    openssh
    safe-rm
    users
    wget2
  ];
}
