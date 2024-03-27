{ config, ... }: {
  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/config/nvim";
      recursive = true;
    };
    kanata = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/config/kanata";
      recursive = true;
    };
    surfingkeys = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/config/surfingkeys";
      recursive = true;
    };
    svim = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/config/svim";
      recursive = true;
    };
    tridactyl = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-system-config/modules/config/tridactyl";
      recursive = true;
    };
  };
}
