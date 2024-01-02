{ pkgs, ... }: {
  programs = {
    bat = {
      enable = true;
      config = {
        theme = "catppuccin";
        #pager = "less -FR";
        pager = "page -WO -q 90000";
        italic-text = "always";
        style =
          "plain"; # no line numbers, git status, etc... more like cat with colors
      };
      themes = {
        catppuccin = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat"; # Bat uses sublime syntax for its themes
            rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
            sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
          };
          file = "Catppuccin-macchiato.tmTheme";
        };

      };
    };
  };
}
