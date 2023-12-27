{
  description = "Kyle Config Flake";
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
  outputs = inputs: {
    darwinConfigurations.demos-Virtual-Machine = inputs.darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs {
        system = "aarch64-darwin";
      };
      modules = [
        ({pkgs, ...}: {
          # Here go the darwin preferences and config items
          programs.zsh.enable = true;
          environment.shells = [pkgs.bash pkgs.zsh];
          environment.loginShell = pkgs.zsh;
          environment.systemPackages = [pkgs.coreutils];
          users.users.demo = {
            name = "demo";
            home = "/Users/demo";
          };
          nix.extraOptions = ''
            auto-optimise-store = true
            experimental-features = nix-command flakes
          '';
          system.keyboard.enableKeyMapping = true;
          system.keyboard.remapCapsLockToEscape = true;
          fonts.fontDir.enable = true; #DANGER
          fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["Meslo"];})];
          services.nix-daemon.enable = true;
          system.defaults.finder.AppleShowAllExtensions = true;
          system.defaults.finder._FXShowPosixPathInTitle = true;
          system.defaults.dock.autohide = true;
          system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
          system.defaults.NSGlobalDomain.InitialKeyRepeat = 14;
          system.defaults.NSGlobalDomain.KeyRepeat = 1;
          # backwards compat; don't change
          system.stateVersion = 4;
        })
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.demo.imports = [
              ({pkgs, ...}: {
                # Don't change this when you change package input. Leave it alone.
                home.stateVersion = "23.11";
                # Specify my home-manager configs
                home.packages = [pkgs.ripgrep pkgs.fd pkgs.curl pkgs.less];
                home.sessionVariables = {
                  PAGER = "less";
                  CLICOLOR = 1;
                  EDITOR = "nvim";
                };
                programs.home-manager.enable = true;
                programs.bat.enable = true;
                programs.bat.config.theme = "TwoDark";
                programs.fzf.enable = true;
                programs.fzf.enableZshIntegration = true;
                programs.lsd.enable = true;
                programs.lsd.enableAliases = true;
                programs.git = {
                  enable = true;
                  userName = "Kyle";
                  userEmail = "wongyeowkin@gmail.com";
                };
                programs.zsh.enable = true;
                programs.zsh.enableCompletion = true;
                programs.zsh.enableAutosuggestions = true;
                programs.zsh.syntaxHighlighting.enable = true;
                programs.zsh.autocd = true;
                programs.zsh.shellAliases = {};
                programs.starship.enable = true;
                programs.starship.enableZshIntegration = true;
                programs.alacritty = {
                  enable = true;
                  settings.font.normal.family = "MesloLGS Nerf Font Mono";
                  settings.font.size = 16;
                };
              })
            ];
          };
        }
      ];
    };
  };
}
