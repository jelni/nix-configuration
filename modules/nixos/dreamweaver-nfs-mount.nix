{
  fileSystems."/dreamweaver" = {
    device = "dreamweaver:/";
    fsType = "nfs";

    options = [
      "noauto"
      "x-systemd.after=tailscaled.service"
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "x-systemd.requires=tailscaled.service"
    ];
  };
}
