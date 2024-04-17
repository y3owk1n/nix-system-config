{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./packages
    ./session-variables
  ];
  home = {
    # Don't change this when you change package input. Leave it alone.
    stateVersion = "23.11";
    activation = {
      rsync-home-manager-applications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        rsyncArgs="--archive --checksum --chmod=-w --copy-unsafe-links --delete"
        apps_source="$genProfilePath/home-path/Applications"
        moniker="Home Manager Trampolines"
        app_target_base="${config.home.homeDirectory}/Applications"
        app_target="$app_target_base/$moniker"
        mkdir -p "$app_target"
        ${pkgs.rsync}/bin/rsync $rsyncArgs "$apps_source/" "$app_target"
      '';
    };
  };
}
