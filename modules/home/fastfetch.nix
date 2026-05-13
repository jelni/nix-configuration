{ lib, ... }:
{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo.color =
        let
          colors = [
            "#5bcefa"
            "#f5a9b8"
            "#ffffff"
          ];
        in
        builtins.listToAttrs (
          builtins.genList (
            i:
            lib.nameValuePair (toString (i + 1)) (builtins.elemAt colors (lib.mod i (builtins.length colors)))
          ) 9
        );

      modules = [
        "title"
        "separator"
        "os"
        "host"
        "packages"
        "shell"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "publicip"
        "break"
        "colors"
      ];
    };
  };
}
