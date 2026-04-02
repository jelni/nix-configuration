{
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    profileDir = "/srv/";

    serverConfig = {
      Application.FileLogger.Enabled = false;

      BitTorrent.Session = {
        DisableAutoTMMByDefault = false;

        DisableAutoTMMTriggers = {
          CategorySavePathChanged = false;
          DefaultSavePathChanged = false;
        };

        I2P.MixedMode = true;
        MaxConnections = -1;
        MaxConnectionsPerTorrent = -1;
        MaxUploads = -1;
        MaxUploadsPerTorrent = -1;
        QueueingSystemEnabled = false;
      };

      LegalNotice.Accepted = true;

      Preferences = {
        General.StatusbarExternalIPDisplayed = true;
        WebUI.LocalHostAuth = false;
      };
    };

    torrentingPort = 25556;
  };
}
