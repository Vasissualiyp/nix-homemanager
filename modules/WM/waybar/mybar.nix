{ pkgs, waybarConfig, workspace_icons, ... }:
{


  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 4; 
        height = waybarConfig."bar_height";
        output = waybarConfig."primary_monitor";
        modules-left = [ "hyprland/workspaces" "hyprland/mode" "wlr/taskbar" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "network" "pulseaudio" "backlight" "keyboard-state" "battery" "tray" "clock" ];

        "hyprland/workspaces" = {
		  active-only = false;
          disable-scroll = true;
          all-outputs = false;
		  format = "{icon}";
          "format-icons" = workspace_icons;
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
                hands-free = "󰟅";
                headset = "󰋎";
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
        output = waybarConfig."secondary_monitors";
        modules-left = [ "hyprland/workspaces" "hyprland/mode" "wlr/taskbar" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "clock" ];

        "hyprland/workspaces" = {
		  active-only = false;
          disable-scroll = true;
          all-outputs = false;
		  format = "{icon}";
          "format-icons" = workspace_icons;
        };
      };
	};
	style = ''
      * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: "Noto Sans CJK KR Regular"; 
        font-size: 20px;
        min-height: 0;
      }
      window#waybar {
        background: transparent;
        /*    background-color: rgba(43, 48, 59, 0.5); */
        /*    border-bottom: 3px solid rgba(100, 114, 125, 0.5); */
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }
      
      #waybar.empty #window {
        background-color: transparent;
      }

      #window {
        margin: 8;
        padding-left: 12;
        padding-right: 12;
        background-color: rgba(0,0,0,0.3);
        font-size:20px;
        font-weight: bold;
      }
      
      button {
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each button name */
        border: none;
        border-radius: 5;
      }
      
      /* https:#github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
        background: inherit;
        border-top: 4px solid #c9545d;
      }
      #workspaces button {
        padding: 0 8px;
        background-color: rgba(0,0,0,0.3); 
      }
      
      #workspaces button:hover {
      }
      
      #workspaces button.focused {
        /*    box-shadow: inset 0 -2px #c9545d; */
        background-color: rgba(0,0,0,0.3);
        color:#c9545d;
        border-top: 2px solid #c9545d;
      }
      
      #workspaces button.urgent {
        background-color: #eb4d4b;
      }
      
      #mode {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
      }
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
        margin: 2px;
        padding-left: 4px;
        padding-right: 4px;
        background-color: rgba(0,0,0,0.3);
        color: #ffffff;
      }
      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      #clock {
        font-size:20px;
        font-weight: bold;
      }

      label:focus {
        background-color: #000000;
      }
      
      #network.disconnected {
        background-color: #f53c3c;
      }
      
      #temperature.critical {
        background-color: #eb4d4b;
      }
      
      #idle_inhibitor.activated {
        background-color: #ecf0f1;
        color: #2d3436;
      }

	'';
  };
}
