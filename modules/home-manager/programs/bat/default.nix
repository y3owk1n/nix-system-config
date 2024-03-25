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
            rev = "b19bea35a85a32294ac4732cad5b0dc6495bed32";
            sha256 = "sha256-POoW2sEM6jiymbb+W/9DKIjDM1Buu1HAmrNP0yC2JPg=";
          };
          file = "themes/Catppuccin Macchiato.tmTheme";
        };

      };
    };
  };
}
