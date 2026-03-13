{ inputs, ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      fish_config prompt choose informative_vcs
      fish_config theme choose catppuccin-mocha
    '';
  };

  xdg.configFile."fish/themes".source = "${inputs.catppuccin-fish}/themes";
}
