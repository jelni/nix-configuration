{ config, inputs, ... }: {
  networking.firewall.allowedTCPPorts = [
    18080
    config.services.monero.rpc.port
  ];

  services.monero = {
    enable = true;
    banlist = "${inputs.monero-banlist}/block.txt";
    dataDir = "/srv/monero";

    extraConfig = ''
      p2p-use-ipv6=1
      public-node=1
      rpc-bind-ipv6-address=::
      rpc-use-ipv6=1
      confirm-external-bind=1
    '';

    limits.threads = 1;
    prune = true;

    rpc = {
      address = "0.0.0.0";
      restricted = true;
    };
  };
}
