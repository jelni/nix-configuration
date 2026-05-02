{ config, ... }:
let
  directory = "/srv/pds";
in
{
  age.secrets.soju-jel-password.file = ../../secrets/bluesky-pds-environment.age;

  services =
    let
      domain = "pds.jel.gay";
    in
    {
      bluesky-pds = {
        enable = true;
        environmentFiles = [ config.age.secrets.soju-jel-password.path ];
        goat.enable = true;

        settings = {
          PDS_HOSTNAME = domain;
          PDS_DATA_DIRECTORY = directory;
          PDS_BLOBSTORE_DISK_LOCATION = "${directory}/blocks";
        };
      };

      caddy.virtualHosts."https://${domain}".extraConfig =
        "reverse_proxy localhost:${toString config.services.bluesky-pds.settings.PDS_PORT}";
    };

  systemd.services.bluesky-pds.serviceConfig.ReadWritePaths = [ directory ];
}
