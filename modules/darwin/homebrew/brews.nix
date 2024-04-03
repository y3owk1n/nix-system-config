{ ... }: {
  homebrew = {
    brews = [
      "sqlite"
      "vercel-cli"
      {
        name = "svim";
        start_service = true;
        restart_service = "changed";
      }
    ];
  };
}
