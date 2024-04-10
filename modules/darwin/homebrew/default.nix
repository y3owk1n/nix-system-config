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
      upgrade = true;
      cleanup = "uninstall";
    };
    global = {
      brewfile = true;
      autoUpdate = true;
    };
    # Things from mac app store
  };
}
