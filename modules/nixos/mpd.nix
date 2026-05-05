{
  services =
    let
      port = "6601";
    in
    {
      caddy.virtualHosts."https://radio.hszyr.space".extraConfig = "reverse_proxy localhost:${port}";

      mpd = {
        enable = true;

        extraConfig = ''
          audio_output {
            type "httpd"
            name "żyrardio"
            port "${port}"
            bind_to_address "0.0.0.0"
            encoder "flac"
            genre "żyrobeat"
          }
        '';

        musicDirectory = "/srv/qBittorrent/downloads";
      };
    };
}
