{ inputs, lib, ... }:
{
  imports = with inputs.tangled.nixosModules; [
    knot
    spindle
  ];

  boot.kernelModules = [ "vhost_vsock" ];

  services =
    let
      knot = "knot.jel.gay";
      spindle = "spindle.jel.gay";
      owner = "did:plc:epnu3w7e72ck3hqeghzjajo3";
    in
    {
      caddy.virtualHosts = {
        ${knot}.extraConfig = "reverse_proxy :5555";
        ${spindle}.extraConfig = "reverse_proxy :6555";
      };

      tangled = {
        knot = {
          enable = true;
          openFirewall = false;

          server = {
            hostname = knot;
            inherit owner;
          };

          stateDir = "/srv/tangled/knot";
        };

        spindle = {
          enable = true;

          server = {
            dbPath = "/srv/tangled/spindle/spindle.db";
            hostname = spindle;
            inherit owner;
          };
        };
      };
    };

  virtualisation = {
    docker.enable = lib.mkForce false;
    podman.dockerSocket.enable = true;
  };
}
