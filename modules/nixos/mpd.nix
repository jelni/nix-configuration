let
  polslop-port = "6604";

  output = name: port: encoder: ''
    audio_output {
      type "httpd"
      name "${name}"
      port "${port}"
      bind_to_address "0.0.0.0"
      encoder "${encoder}"
      genre "żyrobeat"
    }
  '';
in
{
  containers.mpd =
    let
      polslop-path = "/srv/music/polslop";
    in
    {
      autoStart = true;
      bindMounts."${polslop-path}".hostPath = polslop-path;

      config = {
        services.mpd = {
          enable = true;
          extraConfig = output "żyrardio-p0lslop" polslop-port "opus";
          musicDirectory = polslop-path;
          network.port = 6001;
        };

        system.stateVersion = "25.11";
      };
    };

  services =
    let
      flac-port = "6602";
      opus-port = "6603";
    in
    {
      caddy.virtualHosts."https://radio.hszyr.space".extraConfig = ''
        handle / { reverse_proxy localhost:${flac-port} }
        handle /opus { reverse_proxy localhost:${opus-port} }
        handle /sonnet { reverse_proxy localhost:${polslop-port} }
      '';

      mpd = {
        enable = true;

        extraConfig = ''
          ${output "żyrardio" flac-port "flac"}
          ${output "żyrardio-opus" opus-port "opus"}
        '';

        musicDirectory = "/srv/qBittorrent/downloads";
      };
    };
}
