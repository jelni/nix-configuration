{ config, pkgs, ... }:
let
  domain = "jel.gay";
  subdomain = "prosody.${domain}";
  upload-subdomain = "upload.${subdomain}";
  acme-port = "1362";
in
{
  networking.firewall.allowedTCPPorts = [
    5050
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
    caddy.virtualHosts = {
      "http://${subdomain}".extraConfig = ''
        reverse_proxy localhost:${acme-port} {
          header_up Host ${domain}
        }
      '';

      "https://${upload-subdomain}".extraConfig =
        "reverse_proxy localhost:${toString (builtins.elemAt config.services.prosody.httpPorts 0)}";
    };

    prosody = {
      enable = true;
      admins = [ "me@${domain}" ];
      dataDir = "/srv/prosody";

      disco_items = [
        {
          description = "HTTP File Upload";
          url = upload-subdomain;
        }
      ];

      extraConfig = ''
        proxy65_ports = { 5050 }
        storage = "sql"
        trusted_proxies = { "127.0.0.1", "::1" }

        Component "${upload-subdomain}" "http_file_share"
          http_external_url = "https://${upload-subdomain}/"
          http_file_share_daily_quota = 1024*1024*1024
          http_file_share_size_limit = 128*1024*1024
      '';

      extraModules = [
        "http_file_share"
        "sasl2"
        "sasl2_bind2"
        "turn_external"
      ];

      package = pkgs.prosody.override {
        withCommunityModules = [
          "sasl2"
          "sasl2_bind2"
        ];
      };

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
