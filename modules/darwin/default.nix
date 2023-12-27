{pkgs, ...}: {
          # Here go the darwin preferences and config items
	  programs.zsh.enable = true;
	  environment = {
		  shells = with pkgs; [bash zsh];
		  loginShell = pkgs.zsh;
		  systemPackages = with pkgs; [coreutils];
		  systemPath = [ "/opt/homebrew/bin" ];
		  pathsToLink = [ "/Applications" ];
	  };
          users.users.demo = {
            name = "demo";
            home = "/Users/demo";
          };
          nix.extraOptions = ''
            auto-optimise-store = true
            experimental-features = nix-command flakes
          '';
	  system = {
		  keyboard.enableKeyMapping = true;
		  keyboard.remapCapsLockToEscape = true;
	  };
	  fonts = {
		  fontDir.enable = true; #DANGER
		  fonts = [(pkgs.nerdfonts.override {fonts = ["Meslo"];})];
	  };
          services.nix-daemon.enable = true;
	  system = {
		  defaults.finder.AppleShowAllExtensions = true;
		  defaults.finder._FXShowPosixPathInTitle = true;
		  defaults.dock.autohide = true;
		  defaults.NSGlobalDomain.AppleShowAllExtensions = true;
		  defaults.NSGlobalDomain.InitialKeyRepeat = 14;
		  defaults.NSGlobalDomain.KeyRepeat = 1;
		  # backwards compat; don't change
		  stateVersion = 4;
	  };
	  homebrew = {
		  enable = true;
		  caskArgs.no_quarantine = true;
		  global.brewfile = true;
		  # Things from mac app store
		  masApps = {};
		  casks = [ "raycast" "font-geist-mono-nerd-font" ];
		  taps = [ "homebrew/cask-fonts" ];
		  brews = [];
	  };
        }
