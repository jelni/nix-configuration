{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  home.shellAliases.cat = lib.getExe pkgs.bat;

  programs.bat = {
    enable = true;

    config = {
      pager = "moor -no-linenumbers";
      theme = "catppuccin";
    };

    themes.catppuccin = {
      file = "themes/Catppuccin Mocha.tmTheme";
      src = inputs.catppuccin-bat;
    };
  };
}
