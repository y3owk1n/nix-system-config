{ pkgs, ... }: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };
    global = {
      brewfile = true;
      autoUpdate = true;
    };
    # Things from mac app store
    masApps = { };
    casks = [
      "raycast"
      "font-geist-mono-nerd-font"
      "appcleaner"
      "keka"
      "kekaexternalhelper"
      "orbstack"
      "spaceid"
      "stats"
      "onyx"
      "imageoptim"
      "whatsapp"
      "karabiner-elements"
      "lulu"
      "arc"
      "obsidian"
    ];
    taps = [ "homebrew/cask-fonts" "koekeishiya/formulae" ];
    brews = [ "skhd" "yabai" "sqlite" ];
  };
}
