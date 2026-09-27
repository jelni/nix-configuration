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
    copyparty-bomba = agenix-secret ../../secrets/copyparty-bomba.age;
    copyparty-jel = agenix-secret ../../secrets/copyparty-jel.age;
    copyparty-rib = agenix-secret ../../secrets/copyparty-rib.age;
  };

  nixpkgs.overlays = [ inputs.copyparty.overlays.default ];

  services = {
    caddy.virtualHosts."files.jel.gay".extraConfig = "reverse_proxy :3923";

    copyparty =
      let
        directory = "/srv/copyparty";
      in
      {
        enable = true;

        accounts = {
          bomba.passwordFile = config.age.secrets.copyparty-bomba.path;
          jel.passwordFile = config.age.secrets.copyparty-jel.path;
          rib.passwordFile = config.age.secrets.copyparty-rib.path;
        };

        groups = {
          admin = [
            "jel"
            "rib"
          ];

          hszyr = [
            "bomba"
          ];
        };

        settings = {
          au-vol = 100;
          e2dsa = true;
          e2ts = true;
          hist = "${directory}/.hist";
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
            A = "@admin";
          in
          {
            "/" = {
              access = {
                inherit A;
                r = "*";
              };

              path = "${directory}/public";
            };

            "/downloads" = {
              access = {
                r = A;
                g = "*";
              };

              path = "/srv/qBittorrent/downloads";
            };

            "/hszyr" = {
              access = {
                inherit A;
                rwmd = "@hszyr";
              };

              path = "${directory}/hszyr";
            };

            "/jel" = {
              access = { inherit A; };
              path = "${directory}/jel";
            };

            "/rib" = {
              access = { inherit A; };
              path = "${directory}/rib";
            };

            "/unlisted" = {
              access = {
                inherit A;
                g = "*";
              };

              path = "${directory}/unlisted";
            };
          };
      };
  };
}
