{ config, pkgs, ... }:
{
  age.secrets.nix-serve-secret-key.file = ../../secrets/nix-serve-secret-key.age;

  services = {
    caddy.virtualHosts."https://cache.jel.gay".extraConfig =
      "reverse_proxy localhost:${toString config.services.nix-serve.port}";

    nix-serve = {
      enable = true;
      package = pkgs.nix-serve-ng;
      secretKeyFile = config.age.secrets.nix-serve-secret-key.path;
    };
  };
}
