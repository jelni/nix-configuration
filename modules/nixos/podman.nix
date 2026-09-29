{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.podman-compose ];
  systemd.timers.podman-auto-update.wantedBy = [ "timers.target" ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
