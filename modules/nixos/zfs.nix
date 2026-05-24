{ lib, ... }:
{
  boot = {
    supportedFilesystems = [ "zfs" ];
    zfs.forceImportRoot = false;
  };

  fileSystems = lib.genAttrs [ "/" "/nix" "/var" "/home" ] (mountPoint: {
    device = "zpool${if mountPoint == "/" then "/root" else mountPoint}";
    fsType = "zfs";
    options = [ "zfsutil" ];
  });

  services.zfs = {
    autoScrub.enable = true;

    autoSnapshot = {
      enable = true;
      flags = "-pu";
      monthly = 0;
    };
  };
}
