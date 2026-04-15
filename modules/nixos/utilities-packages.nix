{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    _7zz
    dust
    google-cloud-sdk
    nil
    nixd
    nixfmt
    pv
    stripe-cli
  ];
}
