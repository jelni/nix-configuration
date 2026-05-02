{ config, ... }:
{
  services = {
    caddy.virtualHosts."https://home.jel.gay".extraConfig =
      "reverse_proxy localhost:${toString config.services.home-assistant.config.http.server_port}";

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
      };

      extraComponents = [
        "hue"
        "ipp"
        "music_assistant"
        "qbittorrent"
      ];

      openFirewall = true;
    };
  };
}
