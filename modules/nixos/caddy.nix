{
  services.caddy = {
    enable = true;
    virtualHosts."http://".extraConfig = "respond \"hello from {system.hostname}!\"";
  };
}
