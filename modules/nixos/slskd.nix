{ config, ... }:
{
  age.secrets.slskd-environment = {
    file = ../../secrets/slskd-environment.age;
    group = config.services.slskd.user;
    owner = config.services.slskd.group;
  };

  services.slskd = {
    enable = true;
    domain = null;
    environmentFile = config.age.secrets.slskd-environment.path;
    openFirewall = true;

    settings = {
      directories.downloads = "/srv/slskd/downloads";
      remote_file_management = true;
      shares.directories = [ "/srv/slskd/shares" ];
      web.authentication.disabled = true;
    };
  };
}
