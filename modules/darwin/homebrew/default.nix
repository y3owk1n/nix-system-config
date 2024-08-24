{ ... }:
{
  imports = [
    ./mas-apps.nix
    ./taps.nix
    ./casks.nix
    ./brews.nix
  ];
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = true;
      # upgrade = true;
      cleanup = "zap";
    };
    global = {
      brewfile = true;
      autoUpdate = true;
    };
  };
}
