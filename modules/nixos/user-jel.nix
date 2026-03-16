{ config, ... }:
let
  ssh-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeyqBh/je0A8dMXB0m9jxZ0nBWHc5Hj+dFmFBiT5Mdw";
in
{
  age.secrets.jel-password.file = ../../secrets/jel-password.age;
  boot.initrd.network.ssh.authorizedKeys = [ ssh-key ];

  users.users.jel = {
    extraGroups = [
      "docker"
      "ipfs"
      "networkmanager"
      "wheel"
    ];

    hashedPasswordFile = config.age.secrets.jel-password.path;
    isNormalUser = true;
    openssh.authorizedKeys.keys = [ ssh-key ];
  };
}
