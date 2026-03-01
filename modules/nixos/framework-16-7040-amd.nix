{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixos-hardware.nixosModules.framework-16-7040-amd ];
  boot.kernelModules = [ "kvm-amd" ];

  environment.systemPackages = with pkgs; [
    framework-tool-tui
    nvtopPackages.amd
  ];

  hardware.cpu.amd.updateMicrocode = true;
}
