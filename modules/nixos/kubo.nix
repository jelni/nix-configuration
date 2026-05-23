let
  port = "5001";
in
{
  services = {
    caddy.virtualHosts."https://ipfs.jel.gay".extraConfig = "reverse_proxy localhost:${port}";

    kubo = {
      enable = true;
      enableGC = true;

      settings.Addresses.Gateway = [
        "/ip4/0.0.0.0/tcp/${port}"
        "/ip6/::/tcp/${port}"
      ];
    };
  };
}
