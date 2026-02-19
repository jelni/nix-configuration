{ lib, pkgs, ... }:
{
  home.shellAliases.cat = lib.getExe pkgs.bat;

  programs.bat = {
    enable = true;
    config.pager = "moor -no-linenumbers";
  };
}
