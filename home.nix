{ pkgs, ... }:
{
  home = {
    username = "jel";
    homeDirectory = "/home/jel";

    packages = with pkgs; [
      htop
    ];

    stateVersion = "25.05";
  };

  programs = {
    ssh = {
      enable = true;
      extraConfig = ''
        Host *
            IdentityAgent ~/.1password/agent.sock
      '';
    };

    home-manager.enable = true;
  };
}
