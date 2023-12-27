{pkgs, config, ...}: {
	home = {
		# Don't change this when you change package input. Leave it alone.
		stateVersion = "23.11";
		# Specify my home-manager configs
		packages = with pkgs; [ripgrep nodejs_18 bun fd stats luajit minio nodePackages.pnpm rm-improved skhd alacritty neovim fd curl less];
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
    file.".config/tmux" = {
        source = ./tmux;
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
        bat = {
            enable = true;
            };
        fzf = {
            enable = true;
            enableZshIntegration = true;
        };
        lsd = {
            enable = true;
            enableAliases = true;
        };
		git = {
		  enable = true;
		  userName = "Kyle";
		  userEmail = "wongyeowkin@gmail.com";
		};
		git-credential-oauth.enable = true;
        zsh = {
            enable = true;
            enableCompletion = true;
            enableAutosuggestions = true;
            syntaxHighlighting.enable = true;
            autocd = true;
            shellAliases = {
                nixswitch = "darwin-rebuild switch --flake ~/nix-system-config/.#";
                nixup = "pushd ~/nix-system-config; nix flake update; nixswitch; popd";
            };
            initExtraFirst = ''
            if which tmux 2>&1 >/dev/null; then
                if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
                    # Get the list of tmux sessions
                    sessions=$(tmux list-sessions 2> /dev/null)
                    if [ -n "$sessions" ]; then
                        # Check if "Hack" session exists in the list
                        hack_session=$(echo "$sessions" | grep -o 'Hack' | head -n 1)
                        if [ -n "$hack_session" ]; then
                            # If "Hack" session exists, attach to it
                            tmux attach-session -t "Hack"
                        else
                            # If "Hack" session not found, attach to the first one
                            first_session=$(echo "$sessions" | awk -F: '{print $1}' | head -n 1)
                            tmux attach-session -t "$first_session"
                        fi
                    else
                        # If no sessions exist, create and attach to "Hack"
                        tmux new-session -s Hack
                    fi
                fi
            fi
            '';
        };
        starship = {
            enable = true;
            enableZshIntegration = true;
        };
        tmux = {
            enable = true;
            extraConfig = ''
                source-file ~/.config/tmux/tmux-keys.conf
                source-file ~/.config/tmux/tmux-settings.conf
                source-file ~/.config/tmux/tmux-plugins.conf
            '';

        };
        autojump = {
            enable = true;
            enableFishIntegration = true;
            enableZshIntegration = true;
        };
        lazygit = {
            enable = true;
        };
	};
}
