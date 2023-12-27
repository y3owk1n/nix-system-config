{
  description = "Kyle Darwin System";
  inputs = {
    # Where we get most of our software. Giant mono repo with recipes
    # called derivations that say how to build software.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";

    # Manages configs links things into your home directory
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Control system level software and settings including fonts
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    let
      username = "demo";
    in
    {
      # For VM Testing
      darwinConfigurations.demos-Virtual-Machine = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
        };
        specialArgs = {
          inherit inputs username;
        };
        modules = [
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."${username}".imports = [
                ./modules/home-manager
              ];
            };
          }
        ];
      };

      darwinConfigurations.Kyles-Macbook-Air = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
        };
        specialArgs = {
          inherit inputs username;
        };
        modules = [
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.demo.imports = [
                ./modules/home-manager
              ];
            };
          }
        ];
      };
    };
}
