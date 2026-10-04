let
  domain = "baserow.jel.gay";
  port = "3001";
in
{
  services.caddy.virtualHosts.${domain}.extraConfig = "reverse_proxy :${port}";

  virtualisation.oci-containers.containers.baserow = {
    environment.BASEROW_PUBLIC_URL = "https://${domain}";
    image = "docker.io/baserow/baserow";
    labels."io.containers.autoupdate" = "registry";
    ports = [ "${port}:80" ];
    volumes = [ "/srv/baserow:/baserow/data" ];
  };
}
