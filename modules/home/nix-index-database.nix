{ inputs, ... }:
{
  imports = [ inputs.nix-index-database.homeModules.default ];

  programs = {
    nix-index.enableFishIntegration = false;
    nix-index-database.comma.enable = true;
  };
}
