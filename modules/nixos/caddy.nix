{
  services = {
    caddy = {
      enable = true;
      email = "letsencrypt@jel.gay";
      virtualHosts."http://".extraConfig = "respond \"hello from {system.hostname}!\"";
    };

    prometheus.scrapeConfigs = [
      {
        job_name = "caddy";
        static_configs = [ { targets = [ "localhost:2019" ]; } ];
      }
    ];
  };
}
