{ inputs, ... }:
{
  imports = with inputs.tangled.nixosModules; [
    knot
    spindle
  ];

  services =
    let
      knot = "knot.jel.gay";
      spindle = "spindle.jel.gay";
      owner = "did:plc:epnu3w7e72ck3hqeghzjajo3";
    in
    {
      cloudflared.tunnels."73bc3393-f815-4a60-8f3a-c9d8f6d2e0dc".ingress = {
        "${knot}".service = "http://localhost:5555";
        "${spindle}".service = "http://localhost:6555";
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
}
