{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      mkHost = { hostname, username, system }: nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit username inputs;
        };

        modules = [
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
        nixtop = mkHost {
          hostname = "nixtop";
          username = "user";
          system = "x86_64-linux";
        };

        desktop = mkHost {
          hostname = "desktop";
          username = "user";
          system = "x86_64-linux";
        };
      };
    };
}
