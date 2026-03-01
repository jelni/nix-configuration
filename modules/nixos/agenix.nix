{ inputs, perSystem, ... }:
{
  imports = [ inputs.agenix.nixosModules.default ];
  environment.systemPackages = [ perSystem.agenix.default ];
}
