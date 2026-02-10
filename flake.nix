{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-wsl = { url = "github:nix-community/NixOS-WSL/release-25.11"; inputs.nixpkgs.follows = "nixpkgs"; };
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
      nixos-wsl,
      home-manager,
      agenix,
      firefox,
      nix-vscode-extensions,
      ...
    }:
    {
      nixosConfigurations = {hydromechanizator = nixpkgs.lib.nixosSystem {
        modules = [
          ./modules/base.nix
          ./modules/laptop.nix
          nixos-hardware.nixosModules.framework-16-7040-amd
          home-manager.nixosModules.home-manager

          (
            { config, ... }:
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.jel = ./home.nix;

                extraSpecialArgs = {
                  inherit firefox;
                  nixosConfig = config;
                };
              };
            }
          )

          agenix.nixosModules.default
        ];

        specialArgs = {
          inherit agenix;
          inherit nix-vscode-extensions;
        };
      };
      
      hlebak = nixpkgs.lib.nixosSystem {
        modules = [
          ./modules/base.nix
          ./modules/wsl.nix
          nixos-wsl.nixosModules.default
          home-manager.nixosModules.home-manager

          (
            { config, ... }:
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.jel = ./home.nix;

                extraSpecialArgs = {
                  inherit firefox;
                  nixosConfig = config;
                };
              };
            }
          )

          agenix.nixosModules.default
        ];

        specialArgs = {
          inherit agenix;
          inherit nix-vscode-extensions;
        };
      };
      };
    };
}
