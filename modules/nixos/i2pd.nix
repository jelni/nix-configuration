{ ... }:
{
  services = {
    i2pd = {
      enable = true;
      proto.sam.enable = true;
    };

    qbittorrent.serverConfig.BitTorrent.Session.I2P.Enabled = true;
  };
}
