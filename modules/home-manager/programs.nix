{ pkgs, ... }: {
  programs = {
    home-manager.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "catppuccin";
        #pager = "less -FR";
        pager = "page -WO -q 90000";
        italic-text = "always";
        style =
          "plain"; # no line numbers, git status, etc... more like cat with colors
      };
      themes = {
        catppuccin = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat"; # Bat uses sublime syntax for its themes
            rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
            sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
          };
          file = "Catppuccin-macchiato.tmTheme";
        };

      };
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
      colors = {
        "bg+" = "#363a4f";
        bg = "#24273a";
        spinner = "#f4dbd6";
        hl = "#ed8796";
        fg = "#cad3f5";
        header = "#ed8796";
        info = "#c6a0f6";
        pointer = "#f4dbd6";
        marker = "#f4dbd6";
        "fg+" = "#cad3f5";
        prompt = "#c6a0f6";
        "hl+" = "#ed8796";
      };
      defaultCommand = "fd --type f --hidden --exclude .git";
      fileWidgetCommand =
        "fd --exclude .git --type f"; # for when ctrl-t is pressed
      changeDirWidgetCommand =
        "fd --type d --hidden --follow --max-depth 3 --exclude .git";
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    git = {
      enable = true;
      userName = "y3owk1n";
      userEmail = "wongyeowkin@gmail.com";
      extraConfig = {
        github.user = "y3owk1n";
        color.ui = true;
        pull.rebase = true;
        merge.conflictstyle = "diff3";
        init.defaultBranch = "main";
        http.sslVerify = true;
        commit.verbose = true;
        diff.algorithm = "patience";
        protocol.version = "2";
        core.commitGraph = true;
        gc.writeCommitGraph = true;
        push.autoSetupRemote = true;
      } // pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
        # these should speed up vim nvim-tree and other things that watch git repos but
        # only works on mac. see https://github.com/nvim-tree/nvim-tree.lua/wiki/Troubleshooting#git-fsmonitor-daemon
        core.fsmonitor = true;
        core.untrackedcache = true;
      };
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
        x = "exit";
        gg = "lazygit";
        vim = "nvim";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "obs-kyle" =
          "cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Kyle/ && nvim .";
        "obs-traworld" =
          "cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Traworld/ && nvim .";
        nixswitch = "darwin-rebuild switch --flake ~/nix-system-config/.#";
        nixup = "pushd ~/nix-system-config; nix flake update; nixswitch; popd";
        nixcleanup = "bash ~/nix-system-config/cleanup.sh";
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

        # ls after cd
        if ! (( $chpwd_functions[(I)chpwd_cdls] )); then
            chpwd_functions+=(chpwd_cdls)
        fi
        function chpwd_cdls() {
            if [[ -o interactive ]]; then
                emulate -L zsh
                lsd -a
            fi
        }
      '';
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        command_timeout = 1000;
        scan_timeout = 30;
        add_newline = true;
        cmd_duration.disabled = true;
        git_metrics.disabled = false;
      };
    };
    tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 1;
      escapeTime = 0;
      historyLimit = 50000;
      keyMode = "vi";
      mouse = true;
      prefix = "C-t";
      sensibleOnTop = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "screen-256color";
      plugins = with pkgs; [
        tmuxPlugins.sensible
        tmuxPlugins.vim-tmux-navigator
        {
          plugin = tmuxPlugins.catppuccin.overrideAttrs (_: {
            src = pkgs.fetchFromGitHub {
              owner = "catppuccin";
              repo = "tmux";
              rev = "47e33044b4b47b1c1faca1e42508fc92be12131a";
              sha256 = "sha256-kn3kf7eiiwXj57tgA7fs5N2+B2r441OtBlM8IBBLl4I=";
            };
          });
          extraConfig = ''
            set -g @catppuccin_flavour 'macchiato' # or frappe, macchiato, mocha
            set -g @catppuccin_window_left_separator ""
            set -g @catppuccin_window_right_separator " "
            set -g @catppuccin_window_middle_separator " █"
            set -g @catppuccin_window_number_position "right"
            set -g @catppuccin_window_default_fill "number"
            set -g @catppuccin_window_default_text "#W"
            set -g @catppuccin_window_current_fill "number"
            set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
            set -g @catppuccin_status_modules_right "directory meetings date_time"
            set -g @catppuccin_status_modules_left "session"
            set -g @catppuccin_status_left_separator  " "
            set -g @catppuccin_status_right_separator " "
            set -g @catppuccin_status_right_separator_inverse "no"
            set -g @catppuccin_status_fill "icon"
            set -g @catppuccin_status_connect_separator "no"
            set -g @catppuccin_directory_text "#{pane_current_path}"
            set -g @catppuccin_date_time_text "%H:%M"
          '';
        }
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-capture-pane-contents 'on'
            set -g @resurrect-strategy-nvim 'session'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
          '';
        }
        {
          plugin = tmuxPlugins.fzf-tmux-url;
          extraConfig = ''
            set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
            set -g @fzf-url-history-limit '2000'
          '';
        }
      ];
      extraConfig = ''
        unbind o

        unbind %
        bind | split-window -h -c "#{pane_current_path}"

        unbind '"'
        bind - split-window -v -c "#{pane_current_path}"

        unbind r
        bind R source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded..."

        bind -r j resize-pane -D 5
        bind -r k resize-pane -U 5
        bind -r l resize-pane -R 5
        bind -r h resize-pane -L 5
        bind -r m resize-pane -Z

        bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
        bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

        set -ag terminal-overrides ",xterm-256color:RGB"
        set -g focus-events on
        set -g repeat-time 1000
        set -g detach-on-destroy off
        set -g renumber-windows on
        set -g set-clipboard on
        set -g status-position top
        set -g display-time 4000
        set -g status-interval 5
      '';
    };
    autojump = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    lazygit = { enable = true; };
    alacritty = {
      enable = true;
      settings = {
        cursor.style = {
          blinking = "Off";
          shape = "Block";
        };
        env.TERM = "xterm-256color";
        font = {
          bold = {
            family = "GeistMono NF";
            style = "Bold";
          };
          bold_italic = {
            family = "GeistMono NF";
            style = "Bold Italic";
          };
          italic = {
            family = "GeistMono NF";
            style = "Italic";
          };
          normal = {
            family = "GeistMono NF";
            style = "Regular";
          };
          size = 14;
        };
        mouse.hide_when_typing = true;
        scrolling = {
          history = 10000;
          multiplier = 3;
        };
        window = {
          decorations = "buttonless";
          dynamic_title = true;
          padding.x = 10;
          padding.y = 10;
          working_directory = "None";
        };
        colors = {
          primary = {
            background = "#24273A";
            foreground = "#CAD3F5";
            dim_foreground = "#CAD3F5";
            bright_foreground = "#CAD3F5";
          };
          cursor = {
            text = "#24273A";
            cursor = "#F4DBD6";
          };
          vi_mode_cursor = {
            text = "#24273A";
            cursor = "#B7BDF8";
          };
          search = {
            matches = {
              foreground = "#24273A";
              background = "#A5ADCB";
            };
            focused_match = {
              foreground = "#24273A";
              background = "#A6DA95";
            };
            footer_bar = {
              foreground = "#24273A";
              background = "#A5ADCB";
            };
          };
          hints = {
            start = {
              foreground = "#24273A";
              background = "#EED49F";
            };
            end = {
              foreground = "#24273A";
              background = "#A5ADCB";
            };
          };
          selection = {
            text = "#24273A";
            background = "#F4DBD6";
          };
          normal = {
            black = "#494D64"; # surface1
            red = "#ED8796"; # red
            green = "#A6DA95"; # green
            yellow = "#EED49F"; # yellow
            blue = "#8AADF4"; # blue
            magenta = "#F5BDE6"; # pink
            cyan = "#8BD5CA"; # teal
            white = "#B8C0E0"; # subtext1
          };
          bright = {
            black = "#5B6078"; # surface2
            red = "#ED8796"; # red
            green = "#A6DA95"; # green
            yellow = "#EED49F"; # yellow
            blue = "#8AADF4"; # blue
            magenta = "#F5BDE6"; # pink
            cyan = "#8BD5CA"; # teal
            white = "#A5ADCB"; # subtext0
          };
          dim = {
            black = "#494D64"; # surface1
            red = "#ED8796"; # red
            green = "#A6DA95"; # green
            yellow = "#EED49F"; # yellow
            blue = "#8AADF4"; # blue
            magenta = "#F5BDE6"; # pink
            cyan = "#8BD5CA"; # teal
            white = "#B8C0E0"; # subtext1
          };
          indexed_colors = [
            {
              index = 16;
              color = "#F5A97F";
            }
            {
              index = 17;
              color = "#F4DBD6";
            }
          ];
        };
      };
    };
  };
}
