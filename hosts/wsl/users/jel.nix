{ flake, ... }:
{
  imports = [ flake.modules.home-profiles.base ];
  home.stateVersion = "25.11";
}
