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
          "eDP-1"
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
			format = "󰥔 {:%H:%M}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "  {:%Y-%m-%d}";
        };
        "backlight" = {
            # device = acpi_video1;
            format = "{icon} {percent}%";
            format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        "pulseaudio" = {
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
            #on-click = pavucontrol;
        };
        "tray" = {
            # "icon-size" = 21;
            spacing = 5;
        };
        "network" = {
            # interface = wlp2*; # (Optional) To force the use of this interface
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "󰈀 {ifname}";
            tooltip-format = " {ifname} via {gwaddr}";
            format-linked = " {ifname} (No IP)";
            format-disconnected = "Disconnected ⚠ {ifname}";
            format-alt = " {ifname} = {ipaddr}/{cidr}";
        };
      };
      secondBar = {
        layer = "top";
        position = "top";
        height = 20;
        output = [
          #"eDP-1"
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
	#style = ''
    #  window#waybar {
    #    background = transparent;
    #    /*    background-color = rgba(43, 48, 59, 0.5); */
    #    /*    border-bottom = 3px solid rgba(100, 114, 125, 0.5); */
    #    color = #ffffff;
    #    transition-property = background-color;
    #    transition-duration = .5s;
    #  }

    #  window#waybar.hidden {
    #    opacity = 0.2;
    #  }
    #  
    #  #waybar.empty #window {
    #    background-color = transparent;
    #  }

    #  #window {
    #    margin = 2;
    #    padding-left = 8;
    #    padding-right = 8;
    #    background-color = rgba(0,0,0,0.3);
    #    font-size =14px;
    #    font-weight = bold;
    #  }
    #  
    #  button {
    #    /* Use box-shadow instead of border so the text isn't offset */
    #    box-shadow: inset 0 -3px transparent;
    #    /* Avoid rounded borders under each button name */
    #    border: none;
    #    border-radius: 0;
    #  }
    #  
    #  /* https:#github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
    #  button:hover {
    #    background: inherit;
    #    border-top: 2px solid #c9545d;
    #  }
	#'';
  };
}
