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
    {
      darwinConfigurations = {
        # For VM Testing
        demos-Virtual-Machine = darwin.lib.darwinSystem {
          system = [
            # "aarch64-linux"
            # "i686-linux"
            # "x86_64-linux"
            "aarch64-darwin"
            # "x86_64-darwin"
          ];
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
          };
          specialArgs = {
            inherit inputs;
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

        # My Macbook Air M1
        # Run `scutil --get LocalHostName` to get the hostname key
        # Run `whoami` to get the username
        Kyles-MacBook-Air = darwin.lib.darwinSystem {
          system = [
            "aarch64-darwin"
          ];
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
          };
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./modules/darwin
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.kylewong.imports = [
                  ./modules/home-manager
                ];
              };
            }
          ];
        };
      };
    };
}
