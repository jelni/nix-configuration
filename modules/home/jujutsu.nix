{ pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    package = pkgs.unstable.jujutsu;

    settings = {
      git.write-change-id-header = true;

      user = {
        email = "git@jel.gay";
        name = "jel";
      };
    };
  };
}
