{ config, ... }: {
  services = {
    monero.extraConfig =
      let
        socksListenAddress = config.services.tor.client.socksListenAddress;
      in
      "tx-proxy=tor,${socksListenAddress.addr}:${toString socksListenAddress.port},disable_noise";

    tor = {
      enable = true;
      client.enable = true;
    };
  };
}
