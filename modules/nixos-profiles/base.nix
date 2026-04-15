{ flake, ... }:
{
  imports = with flake.nixosModules; [
    agenix
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
