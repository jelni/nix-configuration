{
  services.cloudflared.tunnels."73bc3393-f815-4a60-8f3a-c9d8f6d2e0dc".ingress."pad.jel.gay".service =
    "http://localhost:9001";

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
