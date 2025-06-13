{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, stylix, ... } @ inputs:
    let
      mkHost = { hostname, username, system }: nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit username inputs;
        };

        modules = [
          stylix.nixosModules.stylix
          ./hosts/${hostname}/configuration.nix
          ./hosts/${hostname}/hardware-configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              inherit inputs username;
            };

            home-manager.users.${username} =
              import ./hosts/${hostname}/home.nix;
          }
        ];
      };
    in {
      nixosConfigurations = {
        laptop = mkHost {
          hostname = "laptop";
          username = "user";
          system = "x86_64-linux";
        };

        desktop = mkHost {
          hostname = "desktop";
          username = "user";
          system = "x86_64-linux";
        };

        server = mkHost {
          hostname = "server";
          username = "user";
          system = "x86_64-linux";
        };
      };
    };
}
