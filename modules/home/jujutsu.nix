{ pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    package = pkgs.unstable.jujutsu;

    settings.user = {
      name = "jel";
      email = "25802745+jelni@users.noreply.github.com";
    };
  };
}
