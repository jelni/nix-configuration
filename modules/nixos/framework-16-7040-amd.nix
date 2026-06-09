{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixos-hardware.nixosModules.framework-16-7040-amd ];

  boot = {
    initrd.availableKernelModules = [
      "nvme"
      "sd_mod"
      "thunderbolt"
      "usb_storage"
      "usbhid"
      "xhci_pci"
    ];

    kernelModules = [
      "hid_apple"
      "nft_chain_nat"
      "nft_compat"
      "rfcomm"
      "sd_mod"
      "snd_hrtimer"
      "snd_seq_dummy"
      "snd_usb_audio"
      "uas"
      "uvcvideo"
      "videodev"
      "xt_MASQUERADE"
      "xt_connmark"
      "xt_conntrack"
      "xt_mark"
      "xt_tcpudp"
    ];

    kernelParams = [ "amdgpu.dcdebugmask=0x410" ];
  };

  environment = {
    systemPackages = with pkgs; [
      framework-tool-tui
      nvtopPackages.amd
    ];

    variables.RUSTICL_ENABLE = "radeonsi";
  };

  hardware.graphics.extraPackages = [ pkgs.mesa.opencl ];
}
