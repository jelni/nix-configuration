let
  domain = "peergos.jel.gay";
  port = "7777";
in
{
  services.caddy.virtualHosts.${domain}.extraConfig = "reverse_proxy :${port}";

  virtualisation.oci-containers.containers.peergos = {
    cmd = [
      "daemon"
      "-public-domain"
      domain
      "-public-server"
      "true"
      "-announce-ipfs-addresses"
      "/dns4/ipfs.jel.gay/tcp/4001,/dns4/ipfs.jel.gay/udp/4001/quic-v1,/dns6/ipfs.jel.gay/tcp/4001,/dns6/ipfs.jel.gay/udp/4001/quic-v1"
    ];

    image = "ghcr.io/peergos/web-ui";
    labels."io.containers.autoupdate" = "registry";
    ports = [ "${port}:${port}" ];
    volumes = [ "/srv/peergos:/opt/peergos/data" ];
  };
}
