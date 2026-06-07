{ config, ... }:
{
  services = {
    caddy.globalConfig = "metrics { per_host }";

    grafana.provision.datasources.settings.datasources = [
      {
        name = "Prometheus";
        type = "prometheus";
        url = "http://localhost:${toString config.services.prometheus.port}";
      }
    ];

    prometheus.enable = true;
  };
}
