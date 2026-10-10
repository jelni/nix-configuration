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
  age.secrets.turn-secret-tuwunel =
    let
      tuwunel = config.services.matrix-tuwunel;
    in
    {
      file = ../../secrets/turn-secret.age;
      inherit (tuwunel) group;
      owner = tuwunel.user;
    };

  services =
    let
      server_name = "jel.gay";
      domain = "matrix.${server_name}";
    in
    {
      caddy.virtualHosts.${domain}.extraConfig =
        "reverse_proxy :${toString (builtins.elemAt config.services.matrix-tuwunel.settings.global.port 0)}";

      matrix-tuwunel = {
        enable = true;
        package = pkgs.unstable.matrix-tuwunel;

        settings.global = {
          inherit server_name;
          database_path = lib.mkForce database_path;

          turn_uris =
            let
              turn-domain = "turn.${server_name}";
            in
            [
              "turn:${turn-domain}:3478"
              "turns:${turn-domain}:5349"
            ];

          turn_secret_file = config.age.secrets.turn-secret-tuwunel.path;
          rocksdb_optimize_for_spinning_disks = true;
          rocksdb_direct_io = false;
          sentry = true;
          sentry_send_server_name = true;
          sentry_attach_stacktrace = true;
          delete_rooms_after_leave = true;

          well_known = {
            client = "https://${domain}";
            server = "${domain}:443";
          };
        };
      };
    };

  systemd.services.tuwunel.serviceConfig.ReadWritePaths = [ database_path ];
}
