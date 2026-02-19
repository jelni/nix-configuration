{ ... }:
{
  services.tailscale = {
    enable = true;
    extraSetFlags = [ "--ssh" ];
    openFirewall = true;
  };
}
