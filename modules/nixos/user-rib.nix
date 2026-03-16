{ ... }:
let
  ssh-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKH8usn6T8qF/VxkQ5Qciucwa1E6/Rk563PMzy2fwffc";
in
{
  boot.initrd.network.ssh.authorizedKeys = [ ssh-key ];

  users.users.rib = {
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];

    isNormalUser = true;
    openssh.authorizedKeys.keys = [ ssh-key ];
  };
}
