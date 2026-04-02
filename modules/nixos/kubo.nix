let
  port = 5001;
in
{
  networking.firewall.allowedTCPPorts = [ port ];

  services.kubo = {
    enable = true;
    enableGC = true;

    settings.Addresses.Gateway = [
      "/ip4/0.0.0.0/tcp/${toString port}"
      "/ip6/::/tcp/${toString port}"
    ];
  };
}
