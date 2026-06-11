{ inputs, ... }:
{
  imports = [ inputs.nix-index-database.homeModules.default ];

  programs = {
    nix-index.enable = false;
    nix-index-database.comma.enable = true;
  };
}
