{ inputs, perSystem, ... }:
{
  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = {
    freenode-je-password.file = ../../secrets/freenode-je-password.age;
    jel-password.file = ../../secrets/jel-password.age;
    wireless-networks.file = ../../secrets/wireless-networks.age;
  };

  environment.systemPackages = [ perSystem.agenix.default ];
}
