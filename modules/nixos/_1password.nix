{ ... }:
{
  environment.etc."1password/custom_allowed_browsers" = {
    text = "firefox-nightly-bin";
    mode = "0755";
  };

  programs = {
    _1password.enable = true;

    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "jel" ];
    };
  };
}
