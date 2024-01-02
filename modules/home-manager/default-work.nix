{ ... }: {
  imports = [
    ./home.nix
    ./xdg.nix
    ./programs
    ./programs/git/work.nix
    ./programs/starship/imac.nix
  ];
}
