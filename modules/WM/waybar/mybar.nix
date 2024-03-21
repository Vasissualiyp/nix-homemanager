{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 4; 
        height = 20;
        output = [
          #"eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "hyprland/workspaces" "hyprland/mode" "wlr/taskbar" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "network" "pulseaudio" "backlight" "keyboard-state" "battery" "tray" "clock" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
        };
        "battery" = {
            "states" = {
                good = 95;
                warning = 30;
                critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{icon} {time}";
            # format-good = ; # An empty format will hide the module
            # format-full = ;
            "format-icons" = [
			  " "
			  " "
			  " "
			  " "
			  " "
			];
        };
        "clock" = {
            # "timezone": "America/New_York",
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
        };
        "backlight" = {
            # device = acpi_video1;
            format = "{icon} {percent}%";
            format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        pulseaudio = {
            # scroll-step = 1; # %, can be a float
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = " {icon} {volume}% {format_source}";
            format-bluetooth-muted = "󰂲 {icon} {format_source}";
            format-muted = "󰝟 {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            "format-icons" = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
            on-click = pavucontrol;
        };
      };
      secondBar = {
        layer = "top";
        position = "top";
        height = 20;
        output = [
          "eDP-1"
          "DP-1"
          "DP-4"
          "DP-5"
        ];
        modules-left = [ "hyprland/workspaces" "hyprland/mode" "wlr/taskbar" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "clock" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
        };
      };
	};
  };
}
