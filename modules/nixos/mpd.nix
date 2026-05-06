{
  services =
    let
      flac-port = "6601";
      opus-port = "6602";
    in
    {
      caddy.virtualHosts."https://radio.hszyr.space".extraConfig = ''
        handle / { reverse_proxy localhost:${flac-port} }
        handle /opus { reverse_proxy localhost:${opus-port} }
      '';

      mpd = {
        enable = true;

        extraConfig =
          let
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
          ''
            ${output "żyrardio" flac-port "flac"}
            ${output "żyrardio-opus" opus-port "opus"}
          '';

        musicDirectory = "/srv/qBittorrent/downloads";
      };
    };
}
