{
  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "letsencrypt@jel.gay";
      webroot = "/var/lib/acme/acme-challenge";
    };
  };
}
