{ config, ... }:
{
  services = {
    cloudflared.tunnels."73bc3393-f815-4a60-8f3a-c9d8f6d2e0dc".ingress."home.jel.gay".service =
      "http://localhost:${toString config.services.home-assistant.config.http.server_port}";

    home-assistant = {
      enable = true;

      config = {
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
        "default_config"
        "hue"
        "ipp"
        "music_assistant"
        "qbittorrent"
      ];

      openFirewall = true;
    };
  };
}
