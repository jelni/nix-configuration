{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.unstable.ollama-rocm;
    rocmOverrideGfx = "11.0.0";
  };
}
