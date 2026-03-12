{ inputs, ... }:
{
  imports = [ inputs.srvos.nixosModules.mixins-latest-zfs-kernel ];

  boot = {
    supportedFilesystems = [ "zfs" ];
    zfs.forceImportRoot = false;
  };

  fileSystems = {
    "/" = {
      device = "zpool/root";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

    "/nix" = {
      device = "zpool/nix";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

    "/var" = {
      device = "zpool/var";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

    "/home" = {
      device = "zpool/home";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };
  };

  services.zfs = {
    autoScrub.enable = true;

    autoSnapshot = {
      enable = true;
      flags = "-pu";
      monthly = 0;
    };
  };
}
