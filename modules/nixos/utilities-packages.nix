{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    _7zz
    azure-cli
    dust
    google-cloud-sdk
    nil
    nixd
    nixfmt
    pv
    stripe-cli
  ];
}
