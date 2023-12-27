{pkgs, ...}: {
	home = {
		# Don't change this when you change package input. Leave it alone.
		stateVersion = "23.11";
		# Specify my home-manager configs
		packages = with pkgs; [ripgrep fd curl less];
		sessionVariables = {
			PAGER = "less";
			  CLICOLOR = 1;
			  EDITOR = "nvim";
		};
		file.".inputrc".source = ./dotfiles/inputrc;
	};
	programs = {
		home-manager.enable = true;
		neovim.enable = true;
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
		  extraConfig = {
			  credential.helper = "oauth";
		  };
		};
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
		alacritty = {
		  enable = true;
		  settings.font.normal.family = "GeistMono NF";
		  settings.font.size = 16;
		};
	};
}
