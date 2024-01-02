{ ... }: {
  imports = [
    ./home.nix
    ./xdg.nix
    ./programs.nix
    ./programs/git
    ./programs/git/work.nix
  ];
}
