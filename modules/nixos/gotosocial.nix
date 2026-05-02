{ config, ... }:
{
  services =
    let
      account-domain = "jel.gay";
      host = "gts.${account-domain}";
      data-path = "/srv/gotosocial";
    in
    {
      caddy.virtualHosts."https://${host}".extraConfig =
        "reverse_proxy localhost:${toString config.services.gotosocial.settings.port}";
      cloudflared.tunnels."73bc3393-f815-4a60-8f3a-c9d8f6d2e0dc".ingress."${host}".service =
        "http://localhost:${toString config.services.gotosocial.settings.port}";

      gotosocial = {
        enable = true;

        settings = {
          landing-page-user = "me";
          inherit host account-domain;
          port = 8000;
          db-address = "${data-path}/sqlite.db";

          instance-languages = [
            "en"
            "pl"
          ];

          instance-expose-public-timeline = true;
          instance-expose-custom-emojis = true;
          instance-inject-mastodon-version = true;
          instance-stats-mode = "serve";
          instance-robots-allow-indexing = true;
          storage-local-base-path = "${data-path}/storage";
        };
      };
    };
}
