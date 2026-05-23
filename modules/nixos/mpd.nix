{ pkgs, ... }:
let
  musicDirectory = "/srv/mpd";
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
  containers.mpd = {
    autoStart = true;
    bindMounts."${musicDirectory}".hostPath = musicDirectory;

    config = {
      services.mpd = {
        enable = true;
        extraConfig = output "żyrardio-p0lslop" polslop-port "opus";
        inherit musicDirectory;
        network.port = 6001;
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

        extraConfig = ''
          ${output "żyrardio" flac-port "flac"}
          ${output "żyrardio-opus" opus-port "opus"}
        '';

        inherit musicDirectory;
      };
    };
}
