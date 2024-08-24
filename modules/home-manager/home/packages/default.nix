{ pkgs, ... }:
let
  extraNodePackages = import ../../node-packages/default.nix { inherit pkgs; };
in
{
  home = {
    packages = with pkgs; [
      ripgrep
      rustup
      corepack_latest
      fnm
      bun
      fd
      minio
      rm-improved
      fd
      curl
      less
      minio
      jq
      tree
      stripe-cli
      postgresql
      lua51Packages.lua
      luajitPackages.luarocks # for nvim
      nixfmt-rfc-style # for nvim
      # --- extraNodePackages ---
      extraNodePackages.cpenv
    ];
  };
}
