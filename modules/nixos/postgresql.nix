{ config, ... }: {
  services = {
    postgresql = {
      enable = true;
      extensions = ps: with ps; [ pgvector ];
    };

    prometheus = {
      exporters.postgres.enable = config.services.prometheus.enable;

      scrapeConfigs = [
        {
          job_name = "postgres";

          static_configs =
            let
              postgres = config.services.prometheus.exporters.postgres;
            in
            [ { targets = [ "${postgres.listenAddress}:${toString postgres.port}" ]; } ];
        }
      ];
    };
  };
}
