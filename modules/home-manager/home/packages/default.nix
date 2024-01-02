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
      pngpaste
      minio
      agkozak-zsh-prompt
    ];
  };
}
