{ ... }:
{
  networking.nameservers = [
    "194.242.2.4#base.dns.mullvad.net"
    "2a07:e340::4#base.dns.mullvad.net"
  ];

  services.resolved = {
    enable = true;
    dnsovertls = "opportunistic";
    dnssec = "allow-downgrade";
    fallbackDns = [ ];
  };
}
