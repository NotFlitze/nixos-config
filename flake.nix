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
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = {
                inherit inputs username;
              };

              users.${username} = import ./hosts/${hostname}/home.nix;

              backupFileExtension = "backup";
            };
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

        backup-server = mkHost {
          hostname = "backup-server";
          username = "user";
          system = "x86_64-linux";
        };
      };
    };
}
