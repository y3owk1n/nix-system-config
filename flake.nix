{
  description = "Kyle Darwin System";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Control system level software and settings including fonts
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    let
      darwinSystem = { system, modules, username, pkgs, ... }:
        darwin.lib.darwinSystem {
          system = system;
          modules = modules ++ [
            (import ./modules/darwin { inherit username pkgs; })
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username}.imports = [ ./modules/home-manager ];
              };
            }
          ];
        };
    in
    {
      darwinConfigurations = {
        demos-Virtual-Machine = darwinSystem {
          system = "aarch64-darwin";
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
          specialArgs = { inherit inputs; };
          modules = [ ];
          username = "demo";
        };

        Kyles-MacBook-Air = darwinSystem {
          system = "aarch64-darwin";
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
          specialArgs = { inherit inputs; };
          modules = [ ];
          username = "kylewong";
        };
      };
    };
}
