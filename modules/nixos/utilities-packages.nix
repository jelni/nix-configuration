{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    _7zz
    azure-cli
    doggo
    duf
    dust
    google-cloud-sdk
    hyperfine
    nil
    nixd
    nixfmt
    procs
    pv
    stripe-cli
  ];
}
