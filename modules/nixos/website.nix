{ config, inputs, ... }: {
  age.secrets.website-tor-secret-key.file = ../../secrets/website-tor-secret-key.age;

  services =
    let
      tor-address = "http://zuzia2c2ggz2ljtsdeofhmdviomlljnib5edb5pxmtiffknl3p3xqyyd.onion";
    in
    {
      caddy.virtualHosts."jel.gay, ${tor-address}".extraConfig = ''
        reverse_proxy /.well-known/matrix/* https://matrix.jel.gay
        reverse_proxy /.well-known/acme-challenge/* http://prosody.jel.gay
        reverse_proxy /.well-known/* https://gts.jel.gay

        root ${inputs.website}/public
        redir /kalkulator /calculator 308
        header Onion-Location ${tor-address}{uri}
        try_files {path}.html
        file_server

        handle_errors 404 {
          rewrite /{err.status_code}.html
          file_server
        }
      '';

      tor.relay.onionServices.website = {
        map = [ 80 ];
        secretKey = config.age.secrets.website-tor-secret-key.path;
      };
    };
}
