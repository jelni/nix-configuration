{ pkgs, ... }:
{
  services.xserver = {
    excludePackages = [ pkgs.xterm ];

    xkb = {
      layout = "pl-workman";
      options = "shift:breaks_caps";

      extraLayouts.pl-workman = {
        description = "Polish (Workman)";
        languages = [ "pol" ];
        symbolsFile = ../../symbols/pl-workman;
      };
    };
  };
}
