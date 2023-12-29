{ config, pkgs, lib, ... }: {
  home.file.yabai = {
    executable = true;
    target = ".config/yabai/yabairc";
    text = ''
      #!/usr/bin/env sh

      # for this to work you must configure sudo such that
      # it will be able to run the command without password

      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      sudo yabai --load-sa

      # global settings
      yabai -m config mouse_follows_focus off
      yabai -m config focus_follows_mouse off
      yabai -m config window_origin_display default
      yabai -m config window_placement second_child
      yabai -m config window_zoom_persist on
      yabai -m config window_shadow on
      yabai -m config window_opacity on
      yabai -m config window_opacity_duration 0.15
      yabai -m config window_animation_duration 0.15
      yabai -m config active_window_opacity 1.0
      yabai -m config normal_window_opacity 0.85
      yabai -m config split_ratio 0.50
      yabai -m config split_type auto
      yabai -m config auto_balance off
      yabai -m config mouse_modifier ctrl
      yabai -m config mouse_action1 move
      yabai -m config mouse_action2 resize
      yabai -m config mouse_drop_action swap

      # general space settings
      yabai -m config layout bsp
      yabai -m config top_padding 10
      yabai -m config bottom_padding 10
      yabai -m config left_padding 10
      yabai -m config right_padding 10
      yabai -m config window_gap 8

      # spaces
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

      echo "yabai configuration loaded.."
    '';
  };

  home.file.skhd = {
    target = ".config/skhd/skhdrc";
    text =
      let yabai = "/opt/homebrew/bin/yabai";
      in ''
        # focus window
        alt - h : ${yabai} -m window --focus west # option - h on mac
        alt - j : ${yabai} -m window --focus south # option - j on mac
        alt - k : ${yabai} -m window --focus north # option - k on mac
        alt - l : ${yabai} -m window --focus east # option - l on mac

        # swap managed window
        shift + alt - h : ${yabai} -m window --swap west
        shift + alt - j : ${yabai} -m window --swap south
        shift + alt - k : ${yabai} -m window --swap north
        shift + alt - l : ${yabai} -m window --swap east

        # toggle window fullscreen zoom
        alt - m : ${yabai} -m window --toggle zoom-fullscreen

        # toggle padding and gap
        alt - g : ${yabai} -m space --toggle padding; ${yabai} -m space --toggle gap

        # float / unfloat window and center on screen
        alt - t : ${yabai} -m window --toggle float;\
                  ${yabai} -m window --grid 4:4:1:1:2:2

        # toggle window split type
        alt - e : ${yabai} -m window --toggle split

        # balance size of windows
        shift + alt - 0 : ${yabai} -m space --balance

        # move window and focus desktop
        shift + alt - 1 : ${yabai} -m window --space 1; ${yabai} -m space --focus 1
        shift + alt - 2 : ${yabai} -m window --space 2; ${yabai} -m space --focus 2
        shift + alt - 3 : ${yabai} -m window --space 3; ${yabai} -m space --focus 3
        shift + alt - 4 : ${yabai} -m window --space 4; ${yabai} -m space --focus 4
        shift + alt - 5 : ${yabai} -m window --space 5; ${yabai} -m space --focus 5
        shift + alt - 6 : ${yabai} -m window --space 6; ${yabai} -m space --focus 6
        shift + alt - 7 : ${yabai} -m window --space 7; ${yabai} -m space --focus 7
        shift + alt - 8 : ${yabai} -m window --space 8; ${yabai} -m space --focus 8
        shift + alt - 9 : ${yabai} -m window --space 9; ${yabai} -m space --focus 9

        # focus spaces
        alt - 1 : ${yabai} -m space --focus 1
        alt - 2 : ${yabai} -m space --focus 2
        alt - 3 : ${yabai} -m space --focus 3
        alt - 4 : ${yabai} -m space --focus 4
        alt - 5 : ${yabai} -m space --focus 5
        alt - 6 : ${yabai} -m space --focus 6
        alt - 7 : ${yabai} -m space --focus 7
        alt - 8 : ${yabai} -m space --focus 8
        alt - 9 : ${yabai} -m space --focus 9
      '';
  };
}
