{
  services = {
    caddy.virtualHosts."gonic.jel.gay".extraConfig = "reverse_proxy :4747";

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
