{
  config,
  lib,
  pkgs,
  ...
}:
let
  database_path = "/srv/tuwunel";
in
{
  services =
    let
      server_name = "jel.gay";
      host = "matrix.${server_name}";
    in
    {
      caddy.virtualHosts."https://${host}".extraConfig =
        "reverse_proxy localhost:${toString (builtins.elemAt config.services.matrix-tuwunel.settings.global.port 0)}";

      matrix-tuwunel = {
        enable = true;
        package = pkgs.unstable.matrix-tuwunel;

        settings.global = {
          inherit server_name;
          database_path = lib.mkForce database_path;
          sentry = true;
          sentry_send_server_name = true;
          sentry_attach_stacktrace = true;
          delete_rooms_after_leave = true;

          well_known = {
            client = "https://${host}";
            server = "${host}:443";
          };
        };
      };
    };

  systemd.services.tuwunel.serviceConfig.ReadWritePaths = [ database_path ];
}
