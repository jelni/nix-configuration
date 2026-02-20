{ config, pkgs, ... }:
{
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;

    users = {
      jel = {
        isNormalUser = true;
        hashedPasswordFile = config.age.secrets.jel-password.path;

        extraGroups = [
          "docker"
          "ipfs"
          "networkmanager"
          "wheel"
        ];
      };

      guest = {
        isNormalUser = true;
        hashedPassword = "";
      };
    };
  };
}
