{ config, inputs, ... }: {
  age.secrets.website-tor-secret-key.file = ../../secrets/website-tor-secret-key.age;

  services = {
    caddy.virtualHosts."http://zuzia2c2ggz2ljtsdeofhmdviomlljnib5edb5pxmtiffknl3p3xqyyd.onion".extraConfig =
      ''
        root ${inputs.website}/public
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
