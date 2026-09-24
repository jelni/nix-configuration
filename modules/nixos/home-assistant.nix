{ config, ... }:
{
  services = {
    caddy.virtualHosts."home.jel.gay".extraConfig =
      "reverse_proxy :${toString config.services.home-assistant.config.http.server_port}";

    home-assistant = {
      enable = true;

      config = {
        default_config = { };
        homeassistant.unit_system = "metric";

        http = {
          use_x_forwarded_for = true;

          trusted_proxies = [
            "127.0.0.1"
            "::1"
          ];
        };

        scrape = [
          {
            resource = "https://walt.is/";

            sensor = [
              {
                name = "Walt waitlist";
                select = "#__NEXT_DATA__";
                value_template = "{{ (value | from_json).props.pageProps.waitlistCount }}";
                state_class = "measurement";
              }
            ];
          }
        ];
      };

      extraComponents = [
        "hue"
        "ipp"
        "qbittorrent"
      ];

      openFirewall = true;
    };
  };
}
