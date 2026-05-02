{
  services.caddy.virtualHosts."https://pad.jel.gay".extraConfig = "reverse_proxy localhost:9001";

  virtualisation.oci-containers.containers.etherpad = {
    environment = {
      DB_TYPE = "sqlite";
      TRUST_PROXY = "true";
    };

    image = "etherpad/etherpad";
    ports = [ "9001:9001" ];
    volumes = [ "/srv/etherpad:/opt/etherpad-lite/var" ];
  };
}
