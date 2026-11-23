{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    _7zz
    azure-cli
    doggo
    duf
    dust
    hyperfine
    magic-wormhole-rs
    nil
    nixd
    nixfmt
    procs
    pv
  ];
}
