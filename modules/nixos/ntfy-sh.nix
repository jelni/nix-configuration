let
  base-url = "https://ntfy.jel.gay";
  directory = "/srv/ntfy";
in
{
  services = {
    caddy.virtualHosts.${base-url}.extraConfig = "reverse_proxy localhost:2586";

    ntfy-sh = {
      enable = true;

      settings = {
        inherit base-url;
        auth-file = "${directory}/user.db";
        auth-default-access = "deny-all";
        behind-proxy = true;
      };
    };
  };

  systemd.services.ntfy-sh.serviceConfig.ReadWritePaths = [ directory ];
}
