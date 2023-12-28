{ pkgs, ... }: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "uninstall";
    };
    global = {
      brewfile = true;
      autoUpdate = false;
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
      "lulu"
    ];
    taps = [
      "homebrew/cask-fonts"
      "koekeishiya/formulae"
    ];
    brews = [
      "yabai"
      "sqlite"
    ];
  };
}
