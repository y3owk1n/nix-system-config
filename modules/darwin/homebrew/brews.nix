{ ... }:
{
  homebrew = {
    brews = [
      "sqlite"
      "vercel-cli"
      "gnu-sed"
      {
        name = "svim";
        start_service = true;
        restart_service = "changed";
      }
    ];
  };
}
