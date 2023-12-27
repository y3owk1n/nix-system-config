{pkgs, config, ...}: {
	home = {
		# Don't change this when you change package input. Leave it alone.
		stateVersion = "23.11";
		# Specify my home-manager configs
		packages = with pkgs; [ripgrep alacritty neovim fd curl less];
		sessionVariables = {
			PAGER = "less";
			  CLICOLOR = 1;
			  EDITOR = "nvim";
		};
		file.".inputrc".source = ./dotfiles/inputrc;
    file.".config/alacritty" = {
      source = ./alacritty;
      recursive = true;
      };
	};
	xdg.configFile = {
		nvim = {
			source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-system-config/modules/home-manager/nvim";
			recursive = true;
		};
	};
	programs = {
		home-manager.enable = true;
		bat.enable = true;
		bat.config.theme = "TwoDark";
		fzf.enable = true;
		fzf.enableZshIntegration = true;
		lsd.enable = true;
		lsd.enableAliases = true;
		git = {
		  enable = true;
		  userName = "Kyle";
		  userEmail = "wongyeowkin@gmail.com";
		};
		git-credential-oauth.enable = true;
		zsh.enable = true;
		zsh.enableCompletion = true;
		zsh.enableAutosuggestions = true;
		zsh.syntaxHighlighting.enable = true;
		zsh.autocd = true;
		zsh.shellAliases = {
			nixswitch = "darwin-rebuild switch --flake ~/nix-system-config/.#";
			nixup = "pushd ~/nix-system-config; nix flake update; nixswitch; popd";
		};
		starship.enable = true;
		starship.enableZshIntegration = true;
	};
}
