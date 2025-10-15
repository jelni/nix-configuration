{ config, ... }:
{
  home = {
    username = "jel";
    homeDirectory = "/home/jel";
    stateVersion = "25.05";
  };

  programs = {
    htop = {
      enable = true;

      settings = {
        tree_view = 1;
        header_layout = "one_100";
      }
      // (
        with config.lib.htop;
        leftMeters [
          (bar "AllCPUs4")
          (bar "Memory")
          (text "ZFSARC")
          (text "DiskIO")
          (text "Uptime")
          (text "LoadAverage")
          (text "Tasks")
        ]
      );
    };

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
