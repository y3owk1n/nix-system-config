{ pkgs, ... }:
let
  extraNodePackages = import ../../node-packages/default.nix { inherit pkgs; };
in
{
  home = {
    packages = with pkgs; [
      ripgrep
      # cargo
      rustup
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
      jq
      agkozak-zsh-prompt
      # --- neovim ---
      # luajit
      # luajitPackages.luarocks # for nvim
      nixfmt-rfc-style # for nvim
      codespell # for nvim
      beautysh # for nvim
      # pngpaste # only used for obsidian.nvim, not using it for now
      # --- extraNodePackages ---
      extraNodePackages.cpenv
      extraNodePackages.generate-release-note
      # extraNodePackages.better-commits
    ];
  };
}
