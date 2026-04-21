{ lib, ... }:
{
  options.gnome-keybindings = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          binding = lib.mkOption { type = lib.types.str; };
          command = lib.mkOption { type = lib.types.str; };
        };
      }
    );
  };
}
