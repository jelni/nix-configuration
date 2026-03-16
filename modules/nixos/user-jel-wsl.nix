{ config, ... }:
{
  age.secrets.wsl-password.file = ../../secrets/wsl-password.age;

  users.users.jel = {
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.age.secrets.wsl-password.path;
    isNormalUser = true;
  };
}
