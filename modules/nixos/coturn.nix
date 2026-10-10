{ config, ... }:
let
  realm = "turn.jel.gay";
  acme-port = "1361";
in
{
  age.secrets.turn-secret-coturn = {
    file = ../../secrets/turn-secret.age;
    group = "turnserver";
    owner = "turnserver";
  };

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
    caddy.virtualHosts."http://${realm}".extraConfig = "reverse_proxy :${acme-port}";

    coturn =
      let
        directory = config.security.acme.certs.${realm}.directory;
      in
      {
        enable = true;
        cert = "${directory}/fullchain.pem";
        pkey = "${directory}/key.pem";
        inherit realm;
        static-auth-secret-file = config.age.secrets.turn-secret-coturn.path;
        use-auth-secret = true;
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
