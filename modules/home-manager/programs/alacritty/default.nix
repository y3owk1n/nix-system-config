{ ... }: {
  programs = {
    alacritty = {
      enable = true;
      settings = {
        cursor.style = {
          blinking = "Off";
          shape = "Block";
        };
        env.TERM = "xterm-256color";
        font = {
          bold = {
            family = "GeistMono NF";
            style = "Bold";
          };
          bold_italic = {
            family = "GeistMono NF";
            style = "Bold Italic";
          };
          italic = {
            family = "GeistMono NF";
            style = "Italic";
          };
          normal = {
            family = "GeistMono NF";
            style = "Regular";
          };
          size = 14;
        };
        mouse.hide_when_typing = true;
        scrolling = {
          history = 10000;
          multiplier = 3;
        };
        window = {
          decorations = "buttonless";
          dynamic_title = true;
          padding.x = 10;
          padding.y = 10;
          working_directory = "None";
        };
        colors = {
          primary = {
            background = "#24273A";
            foreground = "#CAD3F5";
            dim_foreground = "#CAD3F5";
            bright_foreground = "#CAD3F5";
          };
          cursor = {
            text = "#24273A";
            cursor = "#F4DBD6";
          };
          vi_mode_cursor = {
            text = "#24273A";
            cursor = "#B7BDF8";
          };
          search = {
            matches = {
              foreground = "#24273A";
              background = "#A5ADCB";
            };
            focused_match = {
              foreground = "#24273A";
              background = "#A6DA95";
            };
            footer_bar = {
              foreground = "#24273A";
              background = "#A5ADCB";
            };
          };
          hints = {
            start = {
              foreground = "#24273A";
              background = "#EED49F";
            };
            end = {
              foreground = "#24273A";
              background = "#A5ADCB";
            };
          };
          selection = {
            text = "#24273A";
            background = "#F4DBD6";
          };
          normal = {
            black = "#494D64"; # surface1
            red = "#ED8796"; # red
            green = "#A6DA95"; # green
            yellow = "#EED49F"; # yellow
            blue = "#8AADF4"; # blue
            magenta = "#F5BDE6"; # pink
            cyan = "#8BD5CA"; # teal
            white = "#B8C0E0"; # subtext1
          };
          bright = {
            black = "#5B6078"; # surface2
            red = "#ED8796"; # red
            green = "#A6DA95"; # green
            yellow = "#EED49F"; # yellow
            blue = "#8AADF4"; # blue
            magenta = "#F5BDE6"; # pink
            cyan = "#8BD5CA"; # teal
            white = "#A5ADCB"; # subtext0
          };
          dim = {
            black = "#494D64"; # surface1
            red = "#ED8796"; # red
            green = "#A6DA95"; # green
            yellow = "#EED49F"; # yellow
            blue = "#8AADF4"; # blue
            magenta = "#F5BDE6"; # pink
            cyan = "#8BD5CA"; # teal
            white = "#B8C0E0"; # subtext1
          };
          indexed_colors = [
            {
              index = 16;
              color = "#F5A97F";
            }
            {
              index = 17;
              color = "#F4DBD6";
            }
          ];
        };
      };
    };
  };
}
