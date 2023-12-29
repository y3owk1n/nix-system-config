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
      luajitPackages.luarocks
      minio
      nodePackages.pnpm
      rm-improved
      neovim
      fd
      curl
      less
      nixfmt
      nixpkgs-fmt
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
  };
}
