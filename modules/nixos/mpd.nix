{ pkgs, ... }:
let
  music_directory = "/srv/mpd";
  polslop-port = "6604";

  audio_output = name: port: encoder: {
    type = "httpd";
    name = name;
    port = port;
    bind_to_address = "0.0.0.0";
    encoder = encoder;
    genre = "żyrobeat";
  };
in
{
  containers.mpd = {
    autoStart = true;
    bindMounts."${music_directory}".hostPath = music_directory;

    config = {
      services.mpd = {
        enable = true;

        settings = {
          audio_output = [ (audio_output "żyrardio-p0lslop" polslop-port "opus") ];
          inherit music_directory;
          port = 6001;
        };
      };

      system.stateVersion = "25.11";
    };
  };

  environment.systemPackages = [ pkgs.mpc ];

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

        settings = {
          audio_output = [
            (audio_output "żyrardio" flac-port "flac")
            (audio_output "żyrardio-opus" opus-port "opus")
          ];

          inherit music_directory;
        };
      };
    };
}
