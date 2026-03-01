{ config, ... }:
{
  age.secrets.jel-password.file = ../../secrets/jel-password.age;

  users.users = {
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
}
