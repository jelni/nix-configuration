{ config, ... }:
{
  programs.htop = {
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
}
