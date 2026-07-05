{ config, ... }: {
  services = {
    caddy.globalConfig = "metrics { per_host }";

    grafana.provision.datasources.settings.datasources = [
      {
        name = "Prometheus";
        type = "prometheus";
        url = "http://localhost:${toString config.services.prometheus.port}";
      }
    ];

    prometheus = {
      enable = true;

      exporters.node = {
        enable = true;
        enabledCollectors = [ "systemd" ];
      };

      scrapeConfigs = [
        {
          job_name = "node";

          static_configs =
            let
              node = config.services.prometheus.exporters.node;
            in
            [ { targets = [ "${node.listenAddress}:${toString node.port}" ]; } ];
        }
      ];
    };
  };
}
