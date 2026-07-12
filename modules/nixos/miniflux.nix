let
  domain = "https://rss.jel.gay";
  LISTEN_ADDR = "localhost:8800";
in
{
  services = {
    caddy.virtualHosts.${domain}.extraConfig = "reverse_proxy ${LISTEN_ADDR}";

    miniflux = {
      enable = true;

      config = {
        BASE_URL = domain;
        CREATE_ADMIN = false;
        inherit LISTEN_ADDR;
        POLLING_FREQUENCY = 24 * 60;
      };
    };
  };
}
