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
        e2dsa = true;
        e2ts = true;
        rproxy = 1;
        xff-hdr = "CF-Connecting-IP";
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
        };
    };
  };
}
