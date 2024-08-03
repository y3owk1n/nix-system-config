{ pkgs, ... }:
{
  services = {
    skhd = {
      enable = false;
      package = pkgs.skhd;
      skhdConfig = ''
        alt - h : yabai -m window --focus west # option - h on mac
        alt - j : yabai -m window --focus south # option - j on mac
        alt - k : yabai -m window --focus north # option - k on mac
        alt - l : yabai -m window --focus east # option - l on mac

        # swap managed window
        shift + alt - h : yabai -m window --swap west
        shift + alt - j : yabai -m window --swap south
        shift + alt - k : yabai -m window --swap north
        shift + alt - l : yabai -m window --swap east

        # toggle window fullscreen zoom
        alt - m : yabai -m window --toggle zoom-fullscreen

        # toggle padding and gap
        alt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

        # float / unfloat window and center on screen
        alt - t : yabai -m window --toggle float;\
                  yabai -m window --grid 4:4:1:1:2:2

        # toggle window split type
        alt - e : yabai -m window --toggle split

        # balance size of windows
        shift + alt - 0 : yabai -m space --balance

        # move window and focus desktop
        shift + alt - 1 : yabai -m window --space 1; yabai -m space --focus 1
        shift + alt - 2 : yabai -m window --space 2; yabai -m space --focus 2
        shift + alt - 3 : yabai -m window --space 3; yabai -m space --focus 3
        shift + alt - 4 : yabai -m window --space 4; yabai -m space --focus 4
        shift + alt - 5 : yabai -m window --space 5; yabai -m space --focus 5
        shift + alt - 6 : yabai -m window --space 6; yabai -m space --focus 6
        shift + alt - 7 : yabai -m window --space 7; yabai -m space --focus 7
        shift + alt - 8 : yabai -m window --space 8; yabai -m space --focus 8
        shift + alt - 9 : yabai -m window --space 9; yabai -m space --focus 9

        # focus spaces
        cmd + shift + alt + ctrl - 1 : yabai -m space --focus 1
        cmd + shift + alt + ctrl - 2 : yabai -m space --focus 2
        cmd + shift + alt + ctrl - 3 : yabai -m space --focus 3
        cmd + shift + alt + ctrl - 4 : yabai -m space --focus 4
        cmd + shift + alt + ctrl - 5 : yabai -m space --focus 5
        cmd + shift + alt + ctrl - 6 : yabai -m space --focus 6
        cmd + shift + alt + ctrl - 7 : yabai -m space --focus 7
        cmd + shift + alt + ctrl - 8 : yabai -m space --focus 8
        cmd + shift + alt + ctrl - 9 : yabai -m space --focus 9
      '';
    };
  };
}
