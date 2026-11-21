{ config, inputs, ... }:
{
  imports = [ inputs.starla.nixosModules.default ];

  age.secrets.starla-ssh-key = {
    file = ../../secrets/starla-ssh-key.age;
    group = "starla";
    owner = "starla";
  };

  services = {
    prometheus.scrapeConfigs = [
      {
        job_name = "starla";
        static_configs = [ { targets = [ config.services.starla.metrics.listenAddr ]; } ];
      }
    ];

    starla = {
      enable = true;
      reportInterfaceStats = true;
      sshKeyFile = config.age.secrets.starla-ssh-key.path;
    };
  };
}
