{ pkgs, username, ... }: {
  imports = [
    ./env.nix
    ./programs.nix
    ./nix-conf.nix
    ./system.nix
    ./services.nix
    ./homebrew.nix
  ];

  # Fixes error about home dir being /var/empty
  # See https://github.com/nix-community/home-manager/issues/4026
  users.users.${username} = {
    home =
      if pkgs.stdenvNoCC.isDarwin then
        "/Users/${username}"
      else
        "/home/${username}";
  };
}
