{ flake, ... }:
{
  imports = with flake.modules.nixos-profiles; [
    baremetal
    base
    nvidia
    userspace
  ];

  boot = {
    initrd.availableKernelModules = [
      "ahci"
      "nvme"
      "sd_mod"
      "usb_storage"
      "usbhid"
      "xhci_pci"
    ];

    kernelModules = [ "kvm-intel" ];
  };

  networking.hostId = "61e6a400";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
}
