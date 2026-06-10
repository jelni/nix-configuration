{ config, ... }:
let
  domain = "jel.gay";
  subdomain = "prosody.${domain}";
  acme-port = "1362";
in
{
  networking.firewall.allowedTCPPorts = [
    5222
    5223
    5269
    5270
  ];

  security.acme.certs.${domain} = {
    group = config.services.prosody.group;
    listenHTTP = ":${acme-port}";
    postRun = "systemctl restart prosody.service";
  };

  services = {
    caddy.virtualHosts."http://${subdomain}".extraConfig = ''
      reverse_proxy localhost:${acme-port} {
        header_up Host ${domain}
      }
    '';

    prosody = {
      enable = true;
      admins = [ "me@${domain}" ];
      dataDir = "/srv/prosody";

      extraConfig = ''
        proxy65_ports = { 5050 }
        storage = "sql"
      '';

      extraModules = [ "turn_external" ];
      s2sSecureAuth = true;

      ssl =
        let
          directory = config.security.acme.certs.${domain}.directory;
        in
        {
          cert = "${directory}/fullchain.pem";
          key = "${directory}/key.pem";
        };

      virtualHosts.${domain} = {
        enabled = true;
        inherit domain;

        extraConfig = ''
          turn_external_host = "turn.jel.gay"
          turn_external_secret = ""
        '';
      };

      xmppComplianceSuite = false;
    };
  };
}
