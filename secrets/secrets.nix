let
  user-jel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeyqBh/je0A8dMXB0m9jxZ0nBWHc5Hj+dFmFBiT5Mdw";
  host-hydromechanizator = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKpc44dkGAK435at+4wQbrgfv21hqXe03rQrna93QT3u";
  host-wsl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHu2STpuDoldavVByGvUN9e+tP/BfTorGkiixYGVO/4G";

  baremetal = [
    user-jel
    host-hydromechanizator
  ];

  userspace = [
    user-jel
    host-hydromechanizator
  ];

  wsl = [
    user-jel
    host-wsl
  ];
in
{
  "freenode-je-password.age".publicKeys = userspace;
  "jel-password.age".publicKeys = baremetal;
  "wireless-networks.age".publicKeys = baremetal;
  "wsl-password.age".publicKeys = wsl;
}
