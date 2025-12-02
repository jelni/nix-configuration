{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    utils.url = "github:numtide/flake-utils";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
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
      utils,
      nixos-hardware,
      home-manager,
      agenix,
      stylix,
      firefox,
      nix-vscode-extensions,
      ...
    }:
    {
      nixosConfigurations.hydromechanizator = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.framework-16-7040-amd
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix

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
    }
    // utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          packages = [ pkgs.qt6.qtdeclarative ];
          QML_IMPORT_PATH = "${pkgs.qt6.qtdeclarative}/lib/qt-6/qml:${pkgs.quickshell}/lib/qt-6/qml";
          QML2_IMPORT_PATH = "";
        };
      }
    );
}
