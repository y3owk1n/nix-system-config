{ ... }:
{
  programs = {
    kitty = {
      enable = false;
      darwinLaunchOptions = [
        "--single-instance"
        "--start-as=maximized"
      ];
      theme = "Catppuccin-Macchiato";
      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        font_family = "GeistMono NF";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = 14;
        window_padding_width = 10;
        hide_window_decorations = "titlebar-only";
      };
    };
  };
}
