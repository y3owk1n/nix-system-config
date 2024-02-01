{ pkgs, ... }:
let kanata = import ../custom/kanata.nix;
in {
  # Here go the darwin preferences and config items
  environment = {
    systemPackages = with pkgs; [ coreutils cachix kanata ];
    shells = with pkgs; [ bash fish zsh ];
    loginShell = pkgs.fish;
    loginShellInit = ''
      export SHELL=${pkgs.fish}/bin/fish
    '';
    systemPath =
      [ "/opt/homebrew/bin" "/opt/homebrew/sbin" "/run/current-system/sw/bin" ];
    pathsToLink = [ "/Applications" "/share/fish" ];
  };
  launchd.daemons.kanata = {
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      ProgramArguments = [
        "/bin/sh"
        "-c"
        "exec sudo /run/current-system/sw/bin/kanata -n -c /Users/kylewong/.config/kanata/config.kbd"
      ];
      StandardErrorPath = "/var/log/kanata.log";
      StandardOutPath = "/var/log/kanata.log";
    };
  };
}
