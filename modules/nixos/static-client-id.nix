let
  configuration."10-static-client-id" = {
    dhcpV4Config.ClientIdentifier = "mac";
    dhcpV6Config.DUIDType = "link-layer";
    matchConfig.Name = "enp2s0";
    networkConfig.DHCP = "yes";
  };
in
{
  boot.initrd.systemd.network.networks = configuration;
  systemd.network.networks = configuration;
}
