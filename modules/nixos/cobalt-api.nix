{ config, ... }:
let
  domain = "cobalt.jel.gay";
  port = "9000";
  keys = "/keys.json";
in
{
  age.secrets = {
    cobalt-api-configuration = {
      file = ../../secrets/cobalt-api-configuration.age;
      owner = "1000";
    };

    cobalt-api-keys = {
      file = ../../secrets/cobalt-api-keys.age;
      owner = "1000";
    };
  };

  services.caddy.virtualHosts."https://${domain}".extraConfig = "reverse_proxy localhost:${port}";

  virtualisation.oci-containers.containers.cobalt-api = {
    environment = {
      API_URL = "http://${domain}/";
      API_KEY_URL = "file://${keys}";
    };

    environmentFiles = [ config.age.secrets.cobalt-api-configuration.path ];

    extraOptions = [
      "--init"
      "--read-only"
    ];

    image = "ghcr.io/imputnet/cobalt";
    ports = [ "${port}:${port}" ];
    volumes = [ "${config.age.secrets.cobalt-api-keys.path}:${keys}:ro" ];
  };
}
