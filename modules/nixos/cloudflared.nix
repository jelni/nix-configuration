{ config, ... }:
{
  age.secrets = {
    cloudflared-certificate.file = ../../secrets/cloudflared-certificate.age;
    cloudflared-tunnel-dreamweaver.file = ../../secrets/cloudflared-tunnel-dreamweaver.age;
  };

  services.cloudflared = {
    enable = true;
    certificateFile = config.age.secrets.cloudflared-certificate.path;

    tunnels."73bc3393-f815-4a60-8f3a-c9d8f6d2e0dc" = {
      credentialsFile = config.age.secrets.cloudflared-tunnel-dreamweaver.path;
      default = "http_status:404";
    };
  };
}
