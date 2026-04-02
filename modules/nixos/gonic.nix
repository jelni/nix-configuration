{
  services = {
    cloudflared.tunnels."73bc3393-f815-4a60-8f3a-c9d8f6d2e0dc".ingress."gonic.jel.gay".service =
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
