{ pkgs, ... }:
{
  environment = {
    systemPackages = [ pkgs.moor ];

    variables = {
      MOOR = "--no-linenumbers";
      PAGER = "moor";
    };
  };
}
