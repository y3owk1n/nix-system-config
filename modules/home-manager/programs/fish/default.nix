{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting\n
        __autozellij_hook
      '';
      shellInit = ''
        __load-em
        # __autotmux_hook
        __autols_hook
        # __set_tide_variables
        __set_fzf_variables
        fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell fish | source
      '';
      shellAbbrs = {
        c = "clear";
        x = "exit";
        fpp = "_fzf_directory_picker --allow-cd --prompt-name Projects ~/Dev/";
        fpf = "_fzf_file_picker --allow-open-in-editor --prompt-name Files";
        fpfh = "_fzf_file_picker --allow-open-in-editor --show-hidden-files --prompt-name Files+";
        fpc = "_fzf_cmd_history --allow-execute";
        gg = "lazygit";
        za = "zellij attach --create";
        zls = "zellij list-sessions";
        zd = "zellij delete-session";
        zr = "zellij run --";
        zrr = "zellij run --direction right --";
        zrd = "zellij run --direction down --";
        zrf = "zellij run --floating --";
      };
      shellAliases = {
        # "obs-kyle" =
        #   "cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Kyle/ && nvim .";
        # "obs-traworld" =
        #   "cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Traworld/ && nvim .";
        nixswitch = "darwin-rebuild switch --impure --flake ~/nix-system-config/.#";
        nixup = "pushd ~/nix-system-config; nix flake update; nixswitch; popd";
        nixcleanup = "bash ~/nix-system-config/cleanup.sh";
        tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
        cat = "bat";
        n = "nvim";
        nim = "nvim";
        vim = "nvim";
        nvm = "nvim";
        vi = "nvim";
        nvi = "nvim";
        nivm = "nvim";
      };
      plugins = [
        # {
        #   name = "tide";
        #   src = pkgs.fishPlugins.tide.src;
        # }
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
          name = "fishtape_3";
          src = pkgs.fishPlugins.fishtape_3.src;
        }
        {
          name = "fish-fzf";
          src = pkgs.fetchFromGitHub {
            owner = "y3owk1n";
            repo = "fish-fzf";
            rev = "v1.0.1";
            sha256 = "sha256-JD191rdCPmCWRL8n2dDJk6zBQm81qxJp5k4kC9ODalk=";
          };
        }
        {
          name = "fish-x";
          src = pkgs.fetchFromGitHub {
            owner = "y3owk1n";
            repo = "fish-x";
            rev = "v1.3.0";
            sha256 = "sha256-WaLdl1h3XpS8k7lOwj/MMlQTvaaUBT2CWAYYPBcMESc=";
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
        __autozellij_hook = {
          description = "Auto load zellij";
          body = ''
            if not set -q ZELLIJ
                if command -v zellij >/dev/null 2>&1
                    # echo "Zellij is installed"

                    # Get the list of zellij sessions
                    set sessions (zellij list-sessions 2>/dev/null)
                    # echo "Sessions: $sessions"

                    if set -q sessions[1]
                        # echo "Sessions found"

                        # Check if "hack" session exists in the list
                        if string match -q "*hack*" "$sessions"
                            # echo "hack session found"
                            # echo "Attaching to hack session"
                            zellij attach hack
                        else
                            # echo "hack session not found"
                            # If "hack" session not found, attach to the first one
                            set first_session (string split ' ' $sessions[1])[1]
                            # echo "First session: $first_session"
                            # echo "Attaching to first session"
                            zellij attach $first_session
                        end
                    else
                        # echo "No sessions found"
                        # echo "Creating and attaching to hack session"
                        zellij attach hack --create
                    end
                else
                    echo "Zellij is not installed"
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
        # __set_tide_variables = {
        #   body = ''
        #     set -U tide_git_color_branch magenta
        #     set -U tide_left_prompt_frame_enabled false
        #     set -U tide_left_prompt_separator_diff_color \x20
        #     set -U tide_left_prompt_separator_same_color \x20
        #     set -U tide_left_prompt_suffix \x20
        #     set -U tide_right_prompt_frame_enabled false
        #     set -U tide_right_prompt_prefix \x20
        #     set -U tide_right_prompt_separator_diff_color \x20
        #     set -U tide_right_prompt_separator_same_color \x20
        #     set -U tide_right_prompt_suffix 
        #   '';
        # };
        __set_fzf_variables = {
          body = ''
            set -Ux FZF_DEFAULT_OPTS "\
            --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
            --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
            --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
            --color=selected-bg:#494d64 \
            --multi"
          '';
        };
      };
    };
  };
}
