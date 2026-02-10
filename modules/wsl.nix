{pkgs,...}:
{
  nixpkgs.hostPlatform = "x86_64-linux";
    wsl.enable = true;
  wsl.defaultUser = "jel";

  programs.nix-ld.enable = true;

environment.systemPackages = [
    pkgs.wget
];

networking.hostName = "hlebak";

}
