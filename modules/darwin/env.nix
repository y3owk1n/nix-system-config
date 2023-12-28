{ pkgs, ... }: {
  # Here go the darwin preferences and config items
  environment = {
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPackages = with pkgs; [ coreutils ];
    systemPath = [ "/opt/homebrew/bin" "/opt/homebrew/sbin" ];
    pathsToLink = [ "/Applications" ];
  };
}
