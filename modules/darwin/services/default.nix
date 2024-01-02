{ ... }: {
  imports = [ ./skhd.nix ./yabai.nix ];
  services = { nix-daemon.enable = true; };
}
