{ config, pkgs, ... }:
let
  directory = "/srv/garage";
  api_bind_addr = "127.0.0.1:3900";
  domain = "s3.jel.gay";
in
{
  age.secrets.garage-rpc-secret =
    let
      user = config.users.users.garage;
    in
    {
      file = ../../secrets/garage-rpc-secret.age;
      inherit (user) group;
      owner = user.name;
    };

  services = {
    caddy.virtualHosts."https://${domain}".extraConfig = ''
      header Access-Control-Allow-Origin "*"
        header Access-Control-Allow-Methods "*"
        header Access-Control-Allow-Headers "*"
        header Access-Control-Expose-Headers "ETag"

        @options method OPTIONS
        handle @options {
          respond 204
        }

      reverse_proxy ${api_bind_addr}
    '';

    garage = {
      enable = true;
      package = pkgs.garage_2;

      settings = {
        data_dir = "${directory}/data";
        metadata_dir = "${directory}/meta";
        replication_factor = 1;
        rpc_bind_addr = "127.0.0.1:3901";
        rpc_secret_file = config.age.secrets.garage-rpc-secret.path;

        s3_api = {
          inherit api_bind_addr;
          s3_region = "garage";
        };
      };
    };
  };

  systemd.services.garage.serviceConfig.ReadWritePaths = [ directory ];

  users = {
    groups.garage = { };

    users.garage = {
      group = "garage";
      isSystemUser = true;
    };
  };
}
