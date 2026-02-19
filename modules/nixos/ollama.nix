{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    package = pkgs.unstable.ollama;
    rocmOverrideGfx = "11.0.0";
  };
}
