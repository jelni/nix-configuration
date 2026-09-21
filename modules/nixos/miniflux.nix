let
  domain = "rss.jel.gay";
  port = "8800";
in
{
  services = {
    caddy.virtualHosts.${domain}.extraConfig = "reverse_proxy :${port}";

    miniflux = {
      enable = true;

      config = {
        BASE_URL = "https://${domain}";
        CREATE_ADMIN = false;
        LISTEN_ADDR = "localhost:${port}";
        POLLING_FREQUENCY = 24 * 60;
      };
    };
  };
}
