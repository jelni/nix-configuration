{ config, ... }:
let
  domain = "ente.jel.gay";
  accounts-domain = "accounts.${domain}";
  albums-domain = "albums.${domain}";
  api-domain = "api.${domain}";
  cast-domain = "cast.${domain}";
  memories-domain = "memories.${domain}";
in
{
  age.secrets =
    let
      ente = config.services.ente.api;
      secret = file: {
        inherit file;
        inherit (ente) group;
        owner = ente.user;
      };
    in
    {
      ente-jwt-secret = secret ../../secrets/ente-jwt-secret.age;
      ente-key-encryption = secret ../../secrets/ente-key-encryption.age;
      ente-key-hash = secret ../../secrets/ente-key-hash.age;
    };

  services = {
    caddy.virtualHosts =
      let
        # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix
        caddyHost = enteApp: ''
          root * ${
            config.services.ente.web.package.override {
              inherit enteApp;
              enteMainUrl = "https://${domain}";

              extraBuildEnv = {
                NEXT_PUBLIC_ENTE_ENDPOINT = "https://${api-domain}";
                NEXT_PUBLIC_ENTE_ALBUMS_ENDPOINT = "https://${albums-domain}";
              };
            }
          }
          header Access-Control-Allow-Origin "https://${api-domain}"
          try_files {path} {path}.html /index.html
          file_server
        '';
      in
      {
        "https://${accounts-domain}".extraConfig = caddyHost "accounts";
        "https://${albums-domain}".extraConfig = caddyHost "albums";
        "https://${api-domain}".extraConfig =
          "reverse_proxy localhost:${toString config.services.ente.api.settings.http.port}";
        "https://${cast-domain}".extraConfig = caddyHost "cast";
        "https://${domain}".extraConfig = caddyHost "photos";
        "https://${memories-domain}".extraConfig = caddyHost "memories";
      };

    ente.api = {
      enable = true;
      domain = api-domain;
      enableLocalDB = true;

      settings = {
        apps = {
          accounts = "https://${accounts-domain}";
          cast = "https://${cast-domain}";
          memories = "https://${memories-domain}";
          public-albums = "https://${albums-domain}";
        };

        http.port = 3330;
        internal.disable-registration = true;
        jwt.secret._secret = config.age.secrets.ente-jwt-secret.path;

        key = {
          encryption._secret = config.age.secrets.ente-key-encryption.path;
          hash._secret = config.age.secrets.ente-key-hash.path;
        };

        webauthn = {
          rpid = accounts-domain;
          rporigins = [ "https://${accounts-domain}" ];
        };
      };
    };
  };
}
