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
      fd
      curl
      less
      nixfmt
      nixpkgs-fmt
      pngpaste
      minio
      agkozak-zsh-prompt
      markdownlint-cli
      yamllint
      prettierd
      eslint_d
    ];
  };
}
