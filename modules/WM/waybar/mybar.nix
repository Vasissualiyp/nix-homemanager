{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 4; 
        height = 30;
        output = [
          #"eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "hyprland/workspaces" "hyprland/mode" "wlr/taskbar" ];
        modules-center = [ "hyprland/window" ];
        modules-right = "network" "pulseaudio" "backlight" "keyboard-state" "battery" "tray" "clock"

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
      };
      secondBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "hyprland/workspaces" "hyprland/mode" "wlr/taskbar" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "mpd" "battery" "clock" "temperature" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
      };
	};
  };
}
