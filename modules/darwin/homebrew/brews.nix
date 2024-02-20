{ ... }: {
  homebrew = {
    brews = [
      "sqlite"
      {
        name = "svim";
        start_service = true;
        restart_service = "changed";
      }
    ];
  };
}
