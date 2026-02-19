{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    imageScalingMode = "fit";
    polarity = "dark";

    targets = {
      fish.enable = false;
      plymouth.enable = false;
    };
  };
}
