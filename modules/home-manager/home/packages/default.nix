{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      ripgrep
      cargo
      nodejs_18
      bun
      fd
      stats
      luajit
      luajitPackages.luarocks # for nvim
      nixfmt # for nvim
      codespell # for nvim
      beautysh # for nvim
      minio
      nodePackages.pnpm
      rm-improved
      fd
      curl
      less
      neovim
      pngpaste # only used for obsidian.nvim, not using it for now
      minio
      agkozak-zsh-prompt
    ];
  };
}
