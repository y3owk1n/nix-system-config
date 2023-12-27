{ pkgs, config, ... }: {
  home = {
    # Don't change this when you change package input. Leave it alone.
    stateVersion = "23.11";
    # Specify my home-manager configs
    packages = with pkgs; [
      ripgrep
      cargo
      nodejs_18
      bun
      fd
      stats
      luajit
      minio
      nodePackages.pnpm
      rm-improved
      skhd
      alacritty
      neovim
      fd
      curl
      less
    ];
    sessionVariables = {
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      TERM = "xterm-256color";
      KEYTIMEOUT = 1;
      EDITOR = "nvim";
      VISUAL = "nvim";
      GIT_EDITOR = "nvim";
      SYSTEMD_COLORS = "true";
      COLORTERM = "truecolor";
      TERMINAL = "alacritty";
      # BROWSER = "qutebrowser";
      HOMEBREW_NO_AUTO_UPDATE = 1;
      PAGER = "less";
      CLICOLOR = 1;
    };
    file.".inputrc".source = ./dotfiles/inputrc;
    file.".config/alacritty" = {
      source = ./dotfiles/alacritty;
      recursive = true;
    };
    file.".config/tmux" = {
      source = ./dotfiles/tmux;
      recursive = true;
    };
    file.".config/yabai" = {
      source = ./dotfiles/yabai;
      recursive = true;
    };

    file.".config/skhd" = {
      source = ./dotfiles/skhd;
      recursive = true;

    };
  };
  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-system-config/modules/home-manager/dotfiles/nvim";
      recursive = true;
    };
  };
  programs = {
    home-manager.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "Dracula"; # I like the TwoDark colors better, but want bold/italic in markdown docs
        #pager = "less -FR";
        pager = "page -WO -q 90000";
        italic-text = "always";
        style = "plain"; # no line numbers, git status, etc... more like cat with colors
      };
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
      defaultCommand = "\fd --type f --hidden --exclude .git";
      fileWidgetCommand = "\fd --exclude .git --type f"; # for when ctrl-t is pressed
      changeDirWidgetCommand = "\fd --type d --hidden --follow --max-depth 3 --exclude .git";
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
      history = {
        expireDuplicatesFirst = true;
        ignoreSpace = true;
        save = 10000; # save 10,000 lines of history
      };
      defaultKeymap = "viins";
      shellAliases = {
        c = "clear";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        nixswitch = "darwin-rebuild switch --flake ~/nix-system-config/.#";
        nixup = "pushd ~/nix-system-config; nix flake update; nixswitch; popd";
      };
      envExtra = ''
        # don't use global env as it will slow us down
        skip_global_compinit=1
      '';
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
      enableBashIntegration = true;
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
