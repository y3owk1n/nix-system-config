{ config, ... }: {
  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/config/nvim";
      recursive = true;
    };
    karabiner = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/config/karabiner";
      recursive = true;
    };
    kanata = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/config/kanata";
      recursive = true;
    };
  };
}
