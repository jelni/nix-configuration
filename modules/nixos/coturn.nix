{ config, ... }:
let
  realm = "turn.jel.gay";
  acme-port = "1361";
in
{
  networking.firewall =
    let
      ports = [
        config.services.coturn.listening-port
        config.services.coturn.tls-listening-port
      ];
    in
    {
      allowedTCPPorts = ports;

      allowedUDPPortRanges = [
        {
          from = config.services.coturn.min-port;
          to = config.services.coturn.max-port;
        }
      ];

      allowedUDPPorts = ports;
    };

  security.acme.certs.${realm} = {
    group = "turnserver";
    listenHTTP = ":${acme-port}";
    postRun = "systemctl restart coturn.service";
  };

  services = {
    caddy.virtualHosts."http://${realm}".extraConfig = "reverse_proxy localhost:${acme-port}";

    coturn =
      let
        directory = config.security.acme.certs.${realm}.directory;
      in
      {
        enable = true;
        cert = "${directory}/fullchain.pem";
        pkey = "${directory}/key.pem";
        inherit realm;
      };
  };

  systemd.services.coturn =
    let
      acme-service = "acme-${realm}.service";
    in
    {
      after = [ acme-service ];
      requires = [ acme-service ];
    };
}
