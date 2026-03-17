let
  user-jel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeyqBh/je0A8dMXB0m9jxZ0nBWHc5Hj+dFmFBiT5Mdw";
  host-dreamweaver = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGyWXKJDJlphwmyqE8O75EKf8/xbUYrminvff3NZu7/k";
  host-hlebak = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOLi8mbXX3+fmtHj47rM0wWcwcfgivmuXeB2oSIA/1yf";
  host-hydromechanizator = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKpc44dkGAK435at+4wQbrgfv21hqXe03rQrna93QT3u";
  host-wsl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHu2STpuDoldavVByGvUN9e+tP/BfTorGkiixYGVO/4G";

  baremetal = [
    user-jel
    host-dreamweaver
    host-hlebak
    host-hydromechanizator
  ];

  server = [
    user-jel
    host-dreamweaver
  ];

  userspace = [
    user-jel
    host-hlebak
    host-hydromechanizator
  ];

  wsl = [
    user-jel
    host-wsl
  ];
in
{
  "cloudflared-tunnel-dreamweaver.age".publicKeys = server;
  "freenode-je-password.age".publicKeys = userspace;
  "jel-password.age".publicKeys = baremetal;
  "wireless-networks.age".publicKeys = baremetal;
  "wsl-password.age".publicKeys = wsl;
}
