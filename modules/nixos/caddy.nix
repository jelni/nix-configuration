{
  services.caddy = {
    enable = true;
    email = "letsencrypt@jel.gay";
    virtualHosts."http://".extraConfig = "respond \"hello from {system.hostname}!\"";
  };
}
