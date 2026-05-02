{
  config,
  lib,
  pkgs,
  ...
}:
{
  age.secrets.dynamic-dns-url.file = ../../secrets/dynamic-dns-url.age;

  systemd.services.dynamic-dns = {
    after = [ "network-online.target" ];

    path = with pkgs; [
      curl
      iproute2
    ];

    script = ''
      url=$(<${lib.escapeShellArg config.age.secrets.dynamic-dns-url.path})

      update() {
        curl --ipv6 --request POST --silent $url
        last_update=$SECONDS
      }

      update

      ip -6 -brief monitor address dev enp2s0 | while read -d " " _; do
        if (( SECONDS < last_update + 60 )); then
          continue
        fi

        update
      done
    '';

    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
  };
}
