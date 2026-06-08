{ config, ... }:
{
  age.secrets.grafana-secret-key = {
    file = ../../secrets/grafana-secret-key.age;
    group = "grafana";
    owner = "grafana";
  };

  services = {
    caddy.virtualHosts."https://grafana.jel.gay".extraConfig =
      "reverse_proxy ${config.services.grafana.settings.server.http_addr}:${toString config.services.grafana.settings.server.http_port}";

    grafana = {
      enable = true;
      provision.enable = true;

      settings = {
        "auth.anonymous" = {
          enabled = true;
          org_name = "Public";
        };

        security.secret_key = "$__file{${config.age.secrets.grafana-secret-key.path}}";
        server.http_port = 3030;
      };
    };
  };
}
