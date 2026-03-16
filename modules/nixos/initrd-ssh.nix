{ ... }:
{
  boot.initrd = {
    availableKernelModules = [ "r8169" ];

    network = {
      enable = true;

      ssh = {
        enable = true;

        hostKeys = [
          "/etc/secrets/initrd/ssh_host_rsa_key"
          "/etc/secrets/initrd/ssh_host_ed25519_key"
        ];
      };
    };
  };
}
