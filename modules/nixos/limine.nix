{ ... }:
{
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    extraConfig = "timeout: 1";
  };
}
