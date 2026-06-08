{ config, ... }:
let
  domain = "irc.jel.gay";
in
{
  networking.firewall.allowedTCPPorts = [ 6697 ];

  security.acme.certs.${domain} = {
    group = "soju";
    postRun = "systemctl restart soju.service";
  };

  services = {
    caddy.virtualHosts."http://${domain}".extraConfig = ''
      root ${config.security.acme.certs.${domain}.webroot}
      file_server
    '';

    soju =
      let
        directory = config.security.acme.certs.${domain}.directory;
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
