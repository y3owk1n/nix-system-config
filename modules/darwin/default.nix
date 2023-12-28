{ pkgs, ... }: {
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
  users.users = {
    demo = {
      home = "/Users/demo";
    };
    kylewong = {
      home = "/Users/kylewong";
    };

  };
}
