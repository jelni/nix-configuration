{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixos-hardware.nixosModules.framework-16-7040-amd ];

  boot = {
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "thunderbolt"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];

    kernelModules = [ "kvm-amd" ];
  };

  environment.systemPackages = with pkgs; [
    framework-tool-tui
    nvtopPackages.amd
  ];
}
