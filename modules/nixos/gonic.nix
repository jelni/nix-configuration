{ ... }:
{
  services = {
    cloudflared.tunnels."511b8b1c-fbc5-40bd-b8fd-7eabe206ebb4".ingress."gonic.jel.gay".service =
      "http://localhost:4747";

    gonic = {
      enable = true;

      settings = {
        music-path = "/srv/gonic/music";
        podcast-path = "/srv/gonic/podcasts";
        playlists-path = "/srv/gonic/playlists";
        scan-at-start-enabled = true;
        scan-watcher-enabled = true;
        jukebox-enabled = true;
        expvar = true;
      };
    };
  };
}
