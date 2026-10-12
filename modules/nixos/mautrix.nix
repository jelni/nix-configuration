let
  discord-port = "29334";
  telegram-port = "29317";
in
{
  services.caddy.virtualHosts = {
    "discord.mautrix.jel.gay".extraConfig = "reverse_proxy :${discord-port}";
    "telegram.mautrix.jel.gay".extraConfig = "reverse_proxy :${telegram-port}";
  };

  virtualisation.oci-containers.containers =
    let
      directory = "/srv/mautrix";
    in
    {
      mautrix-discord = {
        image = "dock.mau.dev/mautrix/discord";
        labels."io.containers.autoupdate" = "registry";
        ports = [ "${discord-port}:${discord-port}" ];
        volumes = [ "${directory}/discord:/data" ];
      };

      mautrix-telegram = {
        image = "dock.mau.dev/mautrix/telegram";
        labels."io.containers.autoupdate" = "registry";
        ports = [ "${telegram-port}:${telegram-port}" ];
        volumes = [ "${directory}/telegram:/data" ];
      };
    };
}
