{
  boot.initrd.systemd.enable = true;

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXBOOT";
    fsType = "vfat";

    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
}
