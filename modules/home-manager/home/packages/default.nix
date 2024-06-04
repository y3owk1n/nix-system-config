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
      corepack_latest
      nodePackages_latest.vercel
      nodePackages_latest.nodejs
      # nodePackages_latest.nodejs.pkgs.pnpm
      bun
      fd
      # stats
      minio
      # nodePackages.pnpm
      rm-improved
      fd
      curl
      less
      minio
      jq
      agkozak-zsh-prompt
      tree
      stripe-cli
      # --- apps ---
      appcleaner
      keka
      stats
      # --- neovim ---
      eslint_d
      luajit
      luajitPackages.luarocks # for nvim
      luajitPackages.vusted # for nvim
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
