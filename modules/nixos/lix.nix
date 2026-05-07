{
  nixpkgs.overlays = [ (final: prev: { nix = prev.lixPackageSets.git.lix; }) ];
}
