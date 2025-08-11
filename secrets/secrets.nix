let
  user-jel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeyqBh/je0A8dMXB0m9jxZ0nBWHc5Hj+dFmFBiT5Mdw";
  host-hydromechanizator = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKpc44dkGAK435at+4wQbrgfv21hqXe03rQrna93QT3u";
in
{
  "jel-password.age".publicKeys = [
    user-jel
    host-hydromechanizator
  ];
}
