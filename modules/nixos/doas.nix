{ ... }:
{
  security = {
    sudo.enable = false;

    doas = {
      enable = true;

      extraRules = [
        {
          users = [ "jel" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
