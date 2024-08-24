{
  description = "Kyle Darwin System";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    # home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Control system level software and settings including fonts
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs =
    inputs@{
      nixpkgs-unstable,
      home-manager,
      darwin,
      ...
    }:
    let
      darwinSystem =
        {
          system,
          modules,
          username,
          pkgs,
          ...
        }:
        darwin.lib.darwinSystem {
          system = system;
          modules = modules ++ [
            (import ./modules/darwin {
              inherit
                username
                pkgs
                system
                inputs
                ;
            })
            home-manager.darwinModules.home-manager
          ];
        };
    in
    {
      darwinConfigurations = {
        Kyles-MacBook-Air = darwinSystem {
          system = "aarch64-darwin";
          pkgs = import nixpkgs-unstable { system = "aarch64-darwin"; };
          specialArgs = {
            inherit inputs;
          };
          modules = [
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.kylewong.imports = [ ./modules/home-manager/default-personal.nix ];
              };
            }
          ];
          username = "kylewong";
        };

        Kyles-iMac = darwinSystem {
          system = "aarch64-darwin";
          pkgs = import nixpkgs-unstable { system = "aarch64-darwin"; };
          specialArgs = {
            inherit inputs;
          };
          modules = [
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.kylewong.imports = [ ./modules/home-manager/default-work.nix ];
              };
            }
          ];
          username = "kylewong";
        };
      };
    };
}
