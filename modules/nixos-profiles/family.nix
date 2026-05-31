{ flake, ... }:
{
  imports = with flake.nixosModules; [
    family-packages
    locale-pl
    mutable-users
    plasma
  ];
}
