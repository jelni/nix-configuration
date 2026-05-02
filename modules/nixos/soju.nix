{ config, ... }:
let
  domain = "irc.jel.gay";
  acme-port = "1360";
in
{
  networking.firewall.allowedTCPPorts = [ 6697 ];

  security.acme.certs."${domain}" = {
    group = "soju";
    listenHTTP = ":${acme-port}";
  };

  services = {
    caddy.virtualHosts."http://${domain}".extraConfig = "reverse_proxy localhost:${acme-port}";

    soju =
      let
        directory = config.security.acme.certs."${domain}".directory;
      in
      {
        enable = true;
        tlsCertificate = "${directory}/cert.pem";
        tlsCertificateKey = "${directory}/key.pem";
      };
  };

  systemd.services.soju =
    let
      acme-service = "acme-${domain}.service";
    in
    {
      after = [ acme-service ];
      requires = [ acme-service ];
    };

  users = {
    groups.soju = { };

    users.soju = {
      group = "soju";
      isSystemUser = true;
    };
  };
}
