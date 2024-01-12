{ config, ... }: {
  xdg.configFile = {
    # nvim = {
    #   source = config.lib.file.mkOutOfStoreSymlink
    #     "${config.home.homeDirectory}/nix-system-config/modules/home-manager/dotfiles/nvim";
    #   recursive = true;
    # };
    karabiner = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/home-manager/dotfiles/karabiner";
      recursive = true;
    };
  };
}
