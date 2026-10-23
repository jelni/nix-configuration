{ inputs, ... }: {
  imports = [ inputs.streamed-88x31.nixosModules.default ];

  services =
    let
      port = 8831;
    in
    {
      streamed-88x31 = {
        enable = true;
        host = "127.0.0.1";
        inherit port;
      };

      caddy.virtualHosts."88x31.jel.gay".extraConfig = ''
        reverse_proxy :${toString port} {
          flush_interval -1
        }
      '';
    };
}
