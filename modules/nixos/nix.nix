{ config, inputs, ... }:
{
  imports = [ inputs.srvos.nixosModules.mixins-trusted-nix-caches ];

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = config.nix.settings.trusted-substituters;
      trusted-public-keys = [ "cache.jel.gay:B8uhW2bYk/NlZRVagGpPiYO5HzSAe7GoXJVEESf+9cU=" ];
      trusted-substituters = [ "https://cache.jel.gay?priority=30" ];
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
