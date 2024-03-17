{ ... }: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = { enable = true; };
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
      initExtraBeforeCompInit = ''
        autoload -U promptinit; promptinit
        prompt agkozak-zsh-prompt
        AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' '✘' '!' '»' '?' '$')
        AGKOZAK_LEFT_PROMPT_ONLY=1
        AGKOZAK_PROMPT_CHAR=(    )
        AGKOZAK_COLORS_PROMPT_CHAR=green
        AGKOZAK_COLORS_BRANCH_STATUS=magenta
        AGKOZAK_USER_HOST_DISPLAY=0
        AGKOZAK_BLANK_LINES=1
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
  };
}
