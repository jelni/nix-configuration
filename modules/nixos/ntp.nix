{ ... }:
{
  networking.timeServers = [
    "0.pool.ntp.org"
    "1.pool.ntp.org"
    "2.pool.ntp.org"
    "3.pool.ntp.org"
  ];

  services = {
    chrony = {
      enable = true;

      extraConfig = ''
        minsources 3
        rtconutc
      '';
    };

    timesyncd.enable = false;
  };

  time.timeZone = "Europe/Warsaw";
}
