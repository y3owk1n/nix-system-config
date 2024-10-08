{ ... }:
{
  programs = {
    kitty = {
      enable = true;
      darwinLaunchOptions = [
        "--single-instance"
        "--start-as=maximized"
      ];
      theme = "Catppuccin-Macchiato";
      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        font_family = "JetBrainsMono Nerd Font Mono Regular";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = 14;
        window_padding_width = 10;
        hide_window_decorations = "titlebar-only";
        tab_bar_style = "hidden";
        clear_all_shortcuts = "yes";
        clear_all_mouse_actions = "no";
        confirm_os_window_close = 0;
        input_delay = 0;
        disable_ligatures = "always";
        cursor_blink_interval = 0;
        macos_quit_when_last_window_closed = "yes";
      };
      keybindings = {
        "cmd+w" = "close_window";
        "cmd+q" = "quit";
        "cmd+c" = "copy_to_clipboard";
        "cmd+v" = "paste_from_clipboard";
        "cmd+e" = "open_url_with_hints";
      };
    };
  };
}
