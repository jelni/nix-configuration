{ config, ... }:
{
  age.secrets.grafana-secret-key = {
    file = ../../secrets/grafana-secret-key.age;
    group = "grafana";
    owner = "grafana";
  };

  services =
    let
      domain = "grafana.jel.gay";
    in
    {
      caddy.virtualHosts."https://${domain}".extraConfig =
        "reverse_proxy ${config.services.grafana.settings.server.http_addr}:${toString config.services.grafana.settings.server.http_port}";

      grafana = {
        enable = true;
        provision.enable = true;

        settings = {
          "auth.anonymous" = {
            enabled = true;
            org_name = "Public";
          };

          cloud_migration.enabled = false;
          help.enabled = false;
          news.news_feed_enabled = false;
          security.secret_key = "$__file{${config.age.secrets.grafana-secret-key.path}}";

          server = {
            inherit domain;
            http_port = 3030;
          };
        };
      };
    };
}
