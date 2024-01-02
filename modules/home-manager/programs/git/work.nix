{ ... }: {
  programs = {
    git = {
      userName = "mtraworld";
      userEmail = "marketing@traworld.com";
      extraConfig = { github.user = "mtraworld"; };
    };
  };
}
