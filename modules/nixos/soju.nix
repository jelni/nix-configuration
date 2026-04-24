{
  networking.firewall.allowedTCPPorts = [ 6667 ];

  services.soju = {
    enable = true;
    listen = [ "irc+insecure://0.0.0.0" ];
  };
}
