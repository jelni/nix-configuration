{ ... }:
{
  networking = {
    firewall = {
      allowedTCPPorts = [
        80
        443
      ];
    };

    nftables.enable = true;
  };
}
