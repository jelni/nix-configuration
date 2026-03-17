{ config, ... }:
{
  age.secrets.cloudflared-tunnel-dreamweaver.file = ../../secrets/cloudflared-tunnel-dreamweaver.age;

  services.cloudflared = {
    enable = true;

    tunnels."511b8b1c-fbc5-40bd-b8fd-7eabe206ebb4" = {
      credentialsFile = config.age.secrets.cloudflared-tunnel-dreamweaver.path;
      default = "http_status:404";
    };
  };
}
