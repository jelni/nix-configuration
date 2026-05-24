{ inputs, ... }:
{
  imports = [ inputs.srvos.nixosModules.mixins-trusted-nix-caches ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      (_: prev: {
        unstable = import inputs.nixpkgs-unstable { inherit (prev.stdenv.hostPlatform) system; };
      })
    ];
  };
}
