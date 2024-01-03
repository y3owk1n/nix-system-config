{ pkgs, ... }: {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting\n
      '';
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
      plugins = [
        {
          name = "tide";
          src = pkgs.fishPlugins.tide.src;
        }
        {
          name = "pisces";
          src = pkgs.fishPlugins.pisces.src;
        }
      ];
      functions = { fish_user_key_bindings = "fish_vi_key_bindings"; };
      loginShellInit = ''
        if which tmux >/dev/null 2>&1
            if test "$TERM" != "screen-256color" -a "$TERM" != "screen"
                # Get the list of tmux sessions
                set sessions (tmux list-sessions 2> /dev/null)
                if test -n "$sessions"
                    # Check if "Hack" session exists in the list
                    set hack_session (echo "$sessions" | grep -o 'Hack' | head -n 1)
                    if test -n "$hack_session"
                        # If "Hack" session exists, attach to it
                        tmux attach-session -t "Hack"
                    else
                        # If "Hack" session not found, attach to the first one
                        set first_session (echo "$sessions" | awk -F: '{print $1}' | head -n 1)
                        tmux attach-session -t "$first_session"
                    end
                else
                    # If no sessions exist, create and attach to "Hack"
                    tmux new-session -s Hack
                end
            end
        end

        function __autols_hook --description "Auto ls" --on-event fish_prompt
            if test -z $__autols_initialized
                set -g __autols_initialized 1
                return
            end

            if test "$__autols_last" != (pwd)
                echo; ls
            end
            set -g __autols_last (pwd)
        end
      '';
    };
  };
}
