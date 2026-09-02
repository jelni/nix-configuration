{ config, inputs, ... }:
let
  agenix-secret = file: {
    inherit file;
    inherit (config.services.copyparty) group;
    owner = config.services.copyparty.user;
  };
in
{
  imports = [ inputs.copyparty.nixosModules.default ];

  age.secrets = {
    copyparty-admin = agenix-secret ../../secrets/copyparty-admin.age;
    copyparty-bomba = agenix-secret ../../secrets/copyparty-bomba.age;
  };

  nixpkgs.overlays = [ inputs.copyparty.overlays.default ];

  services = {
    caddy.virtualHosts."https://files.jel.gay".extraConfig = "reverse_proxy localhost:3923";

    copyparty =

      {
        enable = true;

        accounts = {
          admin.passwordFile = config.age.secrets.copyparty-admin.path;
          bomba.passwordFile = config.age.secrets.copyparty-bomba.path;
        };

        groups.hszyr = [ "bomba" ];

        settings = {
          au-vol = 100;
          e2dsa = true;
          e2ts = true;
          hist = "/srv/copyparty/.hist";
          localtime = true;
          qdel = 1;
          rproxy = 1;
          ui-filesz = "4c";
          vc-age = 1;
          vc-exit = true;
          vc-url = "https://api.copyparty.eu/advisories";
          zip-who = 2;
        };

        volumes =
          let
            access.A = "admin";
          in
          {
            "/" = {
              inherit access;
              path = "/srv/copyparty";
            };

            "/downloads" = {
              access = {
                inherit (access) A;
                g = "*";
              };

              path = "/srv/qBittorrent/downloads";
            };

            "/gonic" = {
              inherit access;
              path = "/srv/gonic";
            };

            "/hszyr" = {
              access = {
                inherit (access) A;
                rwmd = "@hszyr";
              };

              path = "/srv/copyparty/hszyr";
            };

            "/public" = {
              access = {
                inherit (access) A;
                r = "*";
              };

              path = "/srv/copyparty/public";
            };

            "/public/unlisted" = {
              access = {
                inherit (access) A;
                g = "*";
              };

              path = "/srv/copyparty/public/unlisted";
            };
          };
      };
  };
}
