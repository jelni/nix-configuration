{ flake, ... }:
{
  imports = with flake.modules.nixos-profiles; [
    baremetal
    base
    latest-zfs-kernel
    server
  ];

  boot = {
    initrd.availableKernelModules = [
      "ahci"
      "nvme"
      "rtsx_pci_sdmmc"
      "sd_mod"
      "usb_storage"
      "usbhid"
      "xhci_pci"
    ];

    kernelModules = [ "kvm-intel" ];
  };

  networking.hostId = "70726f6d";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
}
