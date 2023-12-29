{ pkgs, ... }: {
  nix = {
    package = pkgs.nix;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      experimental-features = nix-command flakes
    '';
    settings = {
      # Because macos sandbox can create issues https://github.com/NixOS/nix/issues/4119
      sandbox = false; # !pkgs.stdenv.isDarwin;
      trusted-users = [
        "demo" # VM Test
        "kylewong" # M1 Mac Air User
        "root"
        "@admin"
        "@wheel"
      ];
      auto-optimise-store = true;
      max-jobs = 8;
      cores = 0; # use them all
      allowed-users = [ "@wheel" ];
      substituters =
        [ "https://cache.nixos.org" "https://nix-community.cachix.org" ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
}
