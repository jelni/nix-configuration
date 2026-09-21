let
  domain = "ntfy.jel.gay";
  directory = "/srv/ntfy";
in
{
  services = {
    caddy.virtualHosts.${domain}.extraConfig = "reverse_proxy :2586";

    ntfy-sh = {
      enable = true;

      settings = {
        base-url = "https://${domain}";
        auth-file = "${directory}/user.db";
        auth-default-access = "deny-all";
        behind-proxy = true;
      };
    };
  };

  systemd.services.ntfy-sh.serviceConfig.ReadWritePaths = [ directory ];
}
