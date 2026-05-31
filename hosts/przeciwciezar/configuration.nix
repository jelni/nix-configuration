{ flake, ... }:
{
  imports = with flake.modules.nixos-profiles; [
    baremetal
    base
    command-line
    family
  ];

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
      "sr_mod"
    ];

    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "mem_sleep_default=s2idle" ];
  };

  networking.hostId = "2ec1c1e2";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "26.05";
}
