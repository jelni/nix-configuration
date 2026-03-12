{ inputs, ... }:
{
  imports = [ inputs.srvos.nixosModules.mixins-trusted-nix-caches ];
  documentation.nixos.enable = false;

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

  nixpkgs.config.allowUnfree = true;
}
