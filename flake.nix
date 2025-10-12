{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        lix.follows = "lix";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix";

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixos-hardware,
      lix-module,
      home-manager,
      agenix,
      firefox,
      nix-vscode-extensions,
      ...
    }:
    {
      nixosConfigurations.hydromechanizator = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.framework-16-7040-amd
          lix-module.nixosModules.default
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.jel = ./home.nix;
            };
          }

          agenix.nixosModules.default
          { programs.firefox.package = firefox.packages.x86_64-linux.firefox-nightly-bin; }
        ];

        specialArgs = {
          inherit agenix;
          inherit nix-vscode-extensions;
        };
      };
    };
}
