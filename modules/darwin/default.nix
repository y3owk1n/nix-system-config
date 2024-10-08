{ pkgs, username, ... }:
{
  imports = [
    ./env
    ./programs
    ./nix-conf
    ./system
    ./services
    ./homebrew
  ];

  # Fixes error about home dir being /var/empty
  # See https://github.com/nix-community/home-manager/issues/4026
  users.users.${username} = {
    home = if pkgs.stdenvNoCC.isDarwin then "/Users/${username}" else "/home/${username}";
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;
}
