{ config, ... }: {
  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/home-manager/dotfiles/k92-nvim";
      recursive = true;
    };
    karabiner = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/home-manager/dotfiles/karabiner";
      recursive = true;
    };
  };
}
