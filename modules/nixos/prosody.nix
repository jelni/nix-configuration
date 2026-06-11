{ config, pkgs, ... }:
let
  domain = "jel.gay";
  subdomain = "prosody.${domain}";
  conference-subdomain = "conference.${subdomain}";
  upload-subdomain = "upload.${subdomain}";
  pubsub-subdomain = "pubsub.${subdomain}";
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
    extraDomainNames = [
      conference-subdomain
      pubsub-subdomain
    ];

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

      "http://${conference-subdomain}, http://${pubsub-subdomain}".extraConfig =
        "reverse_proxy localhost:${acme-port}";

      "https://${subdomain}, https://${upload-subdomain}".extraConfig =
        "reverse_proxy localhost:${toString (builtins.elemAt config.services.prosody.httpPorts 0)}";
    };

    prosody = {
      enable = true;
      admins = [ "me@${domain}" ];
      dataDir = "/srv/prosody";

      extraConfig = ''
        c2s_direct_tls_ports = { 5223 }
        proxy65_ports = { 5050 }
        storage = "sql"
        trusted_proxies = { "127.0.0.1", "::1" }
        Component "${pubsub-subdomain}" "pubsub"
      '';

      extraModules = [
        "cloud_notify"
        "csi_simple"
        "http_file_share"
        "sasl2"
        "sasl2_bind2"
        "smacks"
        "turn_external"
        "websocket"
      ];

      httpFileShare =
        let
          megabyte = 1024 * 1024;
        in
        {
          daily_quota = 1024 * megabyte;
          domain = upload-subdomain;
          http_external_url = "https://${upload-subdomain}/";
          size_limit = 128 * megabyte;
        };

      muc = [ { domain = conference-subdomain; } ];

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
          turn_external_host = "turn.${domain}"
          turn_external_secret = ""
        '';
      };
    };
  };
}
