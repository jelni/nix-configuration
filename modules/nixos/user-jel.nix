{ config, ... }:
{
  age.secrets.jel-password.file = ../../secrets/jel-password.age;

  users.users.jel = {
    extraGroups = [
      "docker"
      "ipfs"
      "networkmanager"
      "wheel"
    ];

    hashedPasswordFile = config.age.secrets.jel-password.path;
    isNormalUser = true;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeyqBh/je0A8dMXB0m9jxZ0nBWHc5Hj+dFmFBiT5Mdw"
    ];
  };
}
