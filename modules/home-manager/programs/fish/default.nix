{ pkgs, ... }: {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting\n
      '';
      shellInit = ''
        __load-em
        __autotmux_hook
        __autols_hook
        __set_tide_variables
      '';
      shellAbbrs = {
        c = "clear";
        x = "exit";
        fpp = "_fzf_directory_picker --allow-cd --prompt-name Projects ~/Dev/";
        fpf = "_fzf_file_picker --allow-open-in-editor --prompt-name Files";
        fpfh =
          "_fzf_file_picker --allow-open-in-editor --show-hidden-files --prompt-name Files+";
        fpc = "_fzf_cmd_history --allow-execute";
      };
      shellAliases = {
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
        {
          name = "sponge";
          src = pkgs.fishPlugins.sponge.src;
        }
        {
          name = "z";
          src = pkgs.fishPlugins.z.src;
        }
        {
          name = "plugin-git";
          src = pkgs.fishPlugins.plugin-git.src;
        }
        {
          name = "colored-man-pages";
          src = pkgs.fishPlugins.colored-man-pages.src;
        }
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
        {
          name = "fish-fzf";
          src = pkgs.fetchFromGitHub {
            owner = "y3owk1n";
            repo = "fish-fzf";
            rev = "ddd3c353f9cebd5bde15379a1c297f6c145b8851";
            sha256 = "sha256-4b/+Z7/LtUPYFC5krU3uTXWMkkmjA9jl2ARGO9kOuho=";
          };
        }
      ];
      functions = {
        __load-em = {
          description = "Loads Fish shell function descriptions.";
          body = ''
            # Load function information so it shows up in auto completion
            # Original from https://github.com/fish-shell/fish-shell/issues/1915#issuecomment-72315918

            for i in (functions | tr , ' ')
                functions $i > /dev/null
            end
          '';
        };
        fish_user_key_bindings = ''
          fish_vi_key_bindings
        '';
        mkdirx = {
          description = "mkdir and cd";
          body = ''
            if test -z $argv
                echo "Usage: mkdirx folder"
                return 1
            end

            set folder $argv[1]

            mkdir -p $folder

            if test $status -ne 0
                echo "Error: Failed to create directory $folder"
                return $status
            end

            cd $folder

            if test $status -ne 0
                echo "Error: Failed to change to directory $folder"
                return $status
            end
          '';
        };
        touchx = {
          description = "touch and open in editor";
          body = ''
            if test -z $argv
                echo "Usage: touchx file"
                return 1
            end

            if not set -q EDITOR
                echo "Error: $EDITOR is not set. Please configure your preferred editor using 'set -Ux EDITOR your-editor'"
                return 1
            end

            if not command -q $EDITOR
                echo "Error: Editor '$EDITOR' not found. Please make sure it is installed and in your PATH."
                return 1
            end

            touch $argv[1]

            $EDITOR $argv[1]
          '';

        };
        gclx = {
          description = "Git clone and cd";
          body = ''
            # Check if an argument is provided
            if test -z $argv
                echo "Usage: gclx owner/repo or gclx https://github.com/owner/repo.git"
                return 1
            end

            # Extract owner and repo names from the argument
            set owner (echo $argv[1] | sed 's|^https://github.com/\(.*\)/\(.*\)\.git$|\1|')
            set repo (echo $argv[1] | sed 's|^https://github.com/\(.*\)/\(.*\)\.git$|\2|')

            # If the argument is not a full URL, assume it's in owner/repo format
            if test "$owner" = "$argv[1]"
                set owner (echo $argv[1] | cut -d '/' -f 1)
                set repo (echo $argv[1] | cut -d '/' -f 2)
            end

            # Perform git clone
            if git clone "https://github.com/$owner/$repo.git" $repo
                # Change to the newly cloned directory
                cd $repo
            else
                echo "Error: Failed to clone repository."
            end
          '';

        };
        __autotmux_hook = {
          description = "Auto load tmux";
          body = ''
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
          '';
        };
        __autols_hook = {
          description = "Auto ls";
          onVariable = "PWD";
          body = ''
            if not set -q __autols_initialized
                set -g __autols_initialized 1
                return
            end

            if test "$PWD" != "$__autols_last"
                echo
                ls
                set -g __autols_last $PWD
            end
          '';
        };
        __set_tide_variables = {
          body = ''
            set -U tide_git_color_branch magenta
            set -U tide_left_prompt_frame_enabled false
            set -U tide_left_prompt_separator_diff_color \x20
            set -U tide_left_prompt_separator_same_color \x20
            set -U tide_left_prompt_suffix \x20
            set -U tide_right_prompt_frame_enabled false
            set -U tide_right_prompt_prefix \x20
            set -U tide_right_prompt_separator_diff_color \x20
            set -U tide_right_prompt_separator_same_color \x20
            set -U tide_right_prompt_suffix 
          '';
        };
      };
    };
  };
}
