{ pkgs, ... }: {
  services = {
    nix-daemon.enable = true;
    yabai = {
      enable = true;
      package = (pkgs.yabai.overrideAttrs (o: rec {
        version = "6.0.2";
        src = builtins.fetchTarball {
          url =
            "https://github.com/koekeishiya/yabai/releases/download/v${version}/yabai-v${version}.tar.gz";
          sha256 =
            "sha256:1vrsvs40c10visi2j7y2ps4ary6gakicwxhbzmww910ic5b9572m";
        };
      }));
      enableScriptingAddition = true;
      config = {
        mouse_follows_focus = "off";
        focus_follows_mouse = "off";
        window_origin_display = "default";
        window_placement = "second_child";
        window_zoom_persist = "on";
        window_shadow = "on";
        window_opacity = "on";
        window_opacity_duration = 0.15;
        window_animation_duration = 0.15;
        active_window_opacity = 1.0;
        normal_window_opacity = 0.85;
        split_ratio = 0.5;
        split_type = "auto";
        auto_balance = "off";
        mouse_modifier = "ctrl";
        mouse_action1 = "move";
        mouse_action2 = "resize";
        mouse_drop_action = "swap";
        layout = "bsp";
        top_padding = 10;
        bottom_padding = 10;
        left_padding = 10;
        right_padding = 10;
        window_gap = 10;
      };

      extraConfig = ''
        yabai -m space 1 --label "Browser"
        yabai -m space 2 --label "Terminal"
        yabai -m space 3 --label "Notes"
        yabai -m space 4 --label "Social"
        yabai -m space 5 --label "Productivity"
        yabai -m space 6 --label "Work"
        yabai -m space 7 --label "Music"

        # Web browsers
        yabai -m rule --add app="^(Google Chrome|Safari|Arc|Microsoft Edge|Safari Technology Preview|Firefox)$" space=1
        # Terminal
        yabai -m rule --add app="^(Terminal|Alacritty)$" space=2
        # Notes
        yabai -m rule --add app="^(Notes|Reminders|Obsidian)$" space=3
        # Social
        yabai -m rule --add app="^(WhatsApp|Messages)$" space=4
        # Productivity
        yabai -m rule --add app="^(Mail|Calendar)$" space=5
        # Work
        yabai -m rule --add app="^(Adobe Photoshop 2024|Adobe Illustrator 2024)$" space=6
        # Music
        yabai -m rule --add app="^(Music)$" space=7

        # apps to not manage (ignore)
        yabai -m rule --add app="^(Finder|System Settings|Archive Utility|Microsoft Excel|Creative Cloud|Logi Options|Raycast|Karabiner-Elements|Karabiner-EventViewer|Stats|FaceTime|Loom)$" manage=off
      '';
    };
  };
}
