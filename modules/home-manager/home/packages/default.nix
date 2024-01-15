{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      ripgrep
      cargo
      nodejs_18
      bun
      fd
      stats
      minio
      nodePackages.pnpm
      rm-improved
      fd
      curl
      less
      minio
      agkozak-zsh-prompt
      # --- neovim ---
      neovim
      luajit
      luajitPackages.luarocks # for nvim
      nixfmt # for nvim
      codespell # for nvim
      beautysh # for nvim
      pngpaste # only used for obsidian.nvim, not using it for now
    ];
  };
}
