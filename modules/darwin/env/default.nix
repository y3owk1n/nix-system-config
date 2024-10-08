{ pkgs, ... }:
{
  # Here go the darwin preferences and config items
  environment = {
    systemPackages = with pkgs; [ coreutils ];
    shells = with pkgs; [
      bash
      fish
      zsh
    ];
    loginShell = pkgs.fish;
    loginShellInit = ''
      export SHELL=${pkgs.fish}/bin/fish
    '';
    systemPath = [
      "/opt/homebrew/bin"
      "/opt/homebrew/sbin"
      "/run/current-system/sw/bin"
    ];
    pathsToLink = [
      "/Applications"
      "/share/fish"
    ];
  };
}
