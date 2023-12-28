{ pkgs, config, ... }: {
  imports = [ ./yabai.nix ];
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
      alacritty
      neovim
      fd
      curl
      less
      karabiner-elements
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
    # file.".config/yabai" = { recursive = true; }; file.".config/skhd" = { source = ./dotfiles/skhd; recursive = true; };
  };
}
