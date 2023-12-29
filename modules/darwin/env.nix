{ pkgs, ... }: {
  # Here go the darwin preferences and config items
  environment = {
    systemPackages = with pkgs; [ coreutils cachix ];
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPath = [ "/opt/homebrew/bin" "/opt/homebrew/sbin" ];
    pathsToLink = [ "/Applications" ];
  };
}
