{ ... }:
{
  homebrew = {
    brews = [
      "sqlite"
      "zellij"
      # "vercel-cli" # install it from nix
      "gnu-sed"
      # {
      #   name = "svim";
      #   start_service = true;
      #   restart_service = "changed";
      # }
    ];
  };
}
