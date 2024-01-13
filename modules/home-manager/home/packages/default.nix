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
      minio
      nodePackages.pnpm
      rm-improved
      fd
      curl
      less
      # pngpaste # only used for obsidian.nvim, not using it for now
      minio
      agkozak-zsh-prompt
    ];
  };
}
