{ config, inputs, ... }:
{
  imports = [ inputs.copyparty.nixosModules.default ];

  age.secrets.copyparty-admin = {
    file = ../../secrets/copyparty-admin.age;
    group = config.services.copyparty.user;
    owner = config.services.copyparty.group;
  };

  networking.firewall.allowedTCPPorts = [ 3923 ];
  nixpkgs.overlays = [ inputs.copyparty.overlays.default ];

  services = {
    cloudflared.tunnels."73bc3393-f815-4a60-8f3a-c9d8f6d2e0dc".ingress."files.jel.gay".service =
      "http://localhost:3923";

    copyparty = {
      enable = true;
      accounts.admin.passwordFile = config.age.secrets.copyparty-admin.path;

      settings = {
        au-vol = 100;
        e2dsa = true;
        e2ts = true;
        localtime = true;
        qdel = 1;
        rproxy = 1;
        ui-filesz = "4c";
        vc-age = 1;
        vc-exit = true;
        vc-url = "https://api.copyparty.eu/advisories";
        ver = true;
        xff-hdr = "CF-Connecting-IP";
        zip-who = 2;
      };

      volumes =
        let
          access = {
            A = "admin";
          };
        in
        {
          "/" = {
            inherit access;
            path = "/srv/copyparty";
          };

          "/downloads" = {
            inherit access;
            path = "/srv/qBittorrent/downloads";
          };

          "/gonic" = {
            inherit access;
            path = "/srv/gonic";
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
