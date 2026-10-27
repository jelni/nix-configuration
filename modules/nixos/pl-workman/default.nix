{ config, ... }: {
  boot.initrd.systemd.services.plymouth-start.environment.XKB_CONFIG_ROOT =
    config.services.xserver.xkb.dir;

  console.useXkbConfig = true;

  services.xserver.xkb = {
    layout = "pl-workman";
    options = "shift:breaks_caps";

    extraLayouts.pl-workman = {
      description = "Polish (Workman)";
      languages = [ "pol" ];
      symbolsFile = symbols/pl-workman;
    };
  };
}
