{ config, ... }:
{
  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-system-config/modules/config/nvim";
      recursive = true;
    };
    zellij = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-system-config/modules/config/zellij";
      recursive = true;
    };
    # wezterm = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-system-config/modules/config/wezterm";
    #   recursive = true;
    # };
    # alacritty = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-system-config/modules/config/alacritty";
    #   recursive = true;
    # };
    aerospace = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-system-config/modules/config/aerospace";
      recursive = true;
    };
    # kitty = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-system-config/modules/config/kitty";
    #   recursive = true;
    # };
  };
}
