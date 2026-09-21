{ config, ... }:
let
  DATA_FOLDER = "/srv/vaultwarden";
in
{
  age.secrets.vaultwarden-environment =
    let
      user = config.users.users.vaultwarden;
    in
    {
      file = ../../secrets/vaultwarden-environment.age;
      inherit (user) group;
      owner = user.name;
    };

  services =
    let
      domain = "vaultwarden.jel.gay";
    in
    {
      caddy.virtualHosts.${domain}.extraConfig =
        "reverse_proxy :${toString config.services.vaultwarden.config.ROCKET_PORT}";

      vaultwarden = {
        enable = true;

        config = {
          CLIENT_SUPPRESS_ONBOARDING = true;
          inherit DATA_FOLDER;
          DNS_PREFER_IPV6 = true;
          ENFORCE_SINGLE_ORG_WITH_RESET_PW_POLICY = true;
          IP_HEADER = "X-Forwarded-For";
          PASSWORD_HINTS_ALLOWED = false;
          ROCKET_PORT = 8222;
          SIGNUPS_ALLOWED = false;
          TRASH_AUTO_DELETE_DAYS = 60;
        };

        inherit domain;
        environmentFile = config.age.secrets.vaultwarden-environment.path;
      };
    };

  systemd.services.vaultwarden.serviceConfig.ReadWritePaths = DATA_FOLDER;
}
