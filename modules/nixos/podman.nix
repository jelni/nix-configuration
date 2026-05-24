{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.podman-compose ];
  systemd.timers.podman-auto-update.wantedBy = [ "multi-user.target" ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
