{ config, ... }:
{
  age.secrets.wsl-password.file = ../../secrets/wsl-password.age;

  users.users.jel = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.wsl-password.path;
    extraGroups = [ "wheel" ];
  };
}
