{ inputs, ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting

      if not set -q SSH_TTY
        fish_config prompt choose informative_vcs
      end

      fish_config theme choose catppuccin-mocha
    '';
  };

  xdg.configFile."fish/themes".source = "${inputs.catppuccin-fish}/themes";
}
