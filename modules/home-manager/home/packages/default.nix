{ pkgs, ... }:
let
  extraNodePackages = import ../../node-packages/default.nix { inherit pkgs; };
in {
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
      lazygit
      agkozak-zsh-prompt
      # --- neovim ---
      neovim
      luajit
      luajitPackages.luarocks # for nvim
      nixfmt # for nvim
      codespell # for nvim
      beautysh # for nvim
      pngpaste # only used for obsidian.nvim, not using it for now
      # --- extraNodePackages ---
      extraNodePackages.cpenv
      extraNodePackages.better-commits
    ];
  };
}
