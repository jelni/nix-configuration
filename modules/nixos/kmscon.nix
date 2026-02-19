{ config, ... }:
{
  services.kmscon = {
    enable = true;
    useXkbConfig = true;
  };

  systemd.services."kmsconvt@".environment.XKB_CONFIG_ROOT = config.services.xserver.xkb.dir;
}
