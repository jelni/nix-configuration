{ ... }:
{
  services.pipewire = {
    enable = true;
    extraConfig.pipewire-pulse.disable-always-sink."pulse.properties"."pulse.cmd.always-sink" = false;
    pulse.enable = true;
  };
}
