{ inputs, ... }:
{
  programs.fish = {
    enable = true;

    shellInit = ''
      set fish_greeting
      fish_config prompt choose informative_vcs
      fish_config theme choose "Catppuccin Mocha"
    '';
  };

  xdg.configFile."fish/themes".source = "${inputs.catppuccin-fish}/themes";
}
