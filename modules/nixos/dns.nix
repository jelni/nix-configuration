{
  networking.nameservers = [
    "94.140.14.14#dns.adguard-dns.com"
    "94.140.15.15#dns.adguard-dns.com"
    "2a10:50c0::ad1:ff#dns.adguard-dns.com"
    "2a10:50c0::ad2:ff#dns.adguard-dns.com"
  ];

  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNSOverTLS = "opportunistic";
      DNSSEC = "allow-downgrade";
      FallbackDNS = [ ];
    };
  };
}
