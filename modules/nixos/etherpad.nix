let
  port = "9001";
in
{
  services.caddy.virtualHosts."pad.jel.gay".extraConfig = "reverse_proxy :${port}";

  virtualisation.oci-containers.containers.etherpad = {
    environment = {
      DB_TYPE = "sqlite";
      TRUST_PROXY = "true";
    };

    image = "docker.io/etherpad/etherpad";
    labels."io.containers.autoupdate" = "registry";
    ports = [ "${port}:${port}" ];
    volumes = [ "/srv/etherpad:/opt/etherpad-lite/var" ];
  };
}
