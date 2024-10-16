{ config, pkgs, lib, inputs, machine_name, numberOfMonitors, splitMonitorWorkspaces, ... }:

let 
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  plugins = inputs.hyprland-plugins.packages.${pkgs.system};

  #cliphist_rofi = pkgs.fetchurl {
  #  url = "https://raw.githubusercontent.com/sentriz/cliphist/master/contrib/cliphist-rofi";
  #  sha256 = "1f7hdaipxy7kbx13as4mmqcnsr84jlx90xj3v0ka4sp05fmb36k3";
  #};
  #cliphist_rofi_img = pkgs.fetchurl {
  #  url = "https://github.com/sentriz/cliphist/blob/master/contrib/cliphist-rofi-img";
  #  sha256 = "0dy4vbgn09q8n7m5lkiw9y7jxysw8b2lqfx2cqb4q2gxnj0fs7m6";
  #};

  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
	#asztal &
	nm-applet --indicator &
	wl-paste --watch cliphist store &
	fcitx5 &
	#${pkgs.dunst}/bin/dunst &
    #hyprctl dispatch exec [workspace 5] "kitty sh -c 'tmux a -t Main' " &
    #hyprctl dispatch exec [workspace 2] "kitty sh -c 'tmux a -t Note' " &
    #hyprctl dispatch exec [workspace 9 silent] "thunderbird" &
    #hyprctl dispatch exec [workspace 8] "qutebrowser"
  '';
	# ADD THIS ABOVE
	#chmod +rx ${cliphist_rofi} &
	#chmod +rx ${cliphist_rofi_img} &
  monitorsConfig = if machine_name == "Vas-Office-Nix" then
    if numberOfMonitors == 6 then {
      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:DP-6"
        "3, monitor:DP-4"
        "4, monitor:DP-4"
        "5, monitor:DP-7"
        "6, monitor:DP-7"
        "7, monitor:DP-7"
        "8, monitor:DP-5"
        "9, monitor:DP-5"
        "0, monitor:HDMI-A-1"
      ];
    } else if numberOfMonitors == 2 then {
      workspace = [
        "1, monitor:HDMI-A-1"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"
        "9, monitor:eDP-1"
        "0, monitor:eDP-1"
      ];
    } else if numberOfMonitors == 5 then {
      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:DP-4"
        "3, monitor:DP-4"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:DP-1"
        "7, monitor:DP-5"
        "8, monitor:DP-5"
        "9, monitor:HDMI-A-1"
        "0, monitor:HDMI-A-1"
      ];
	} else {
      workspace = map (ws: "${toString ws}, monitor:eDP-1") (lib.range 1 10);
    }
  else if machine_name == "Vas-HP-Nix" then 
  {
    workspace = map (ws: "${toString ws}, monitor:eDP-1") (lib.range 1 10);
  }
  else if machine_name == "Vas-Desktop-Nix" then 
  {
      workspace = [
        "1, monitor:DP-2"
        "2, monitor:DP-2"
        "3, monitor:DP-2"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:DP-1"
        "7, monitor:HDMI-A-2"
        "8, monitor:HDMI-A-2"
        "9, monitor:HDMI-A-2"
        "0, monitor:DP-1"
      ];
  }
  else if machine_name == "nicekoffer" then
  {
      workspace = map (ws: "${toString ws}, monitor:HDMI-A-1") (lib.range 1 10);
  }
  else 
  {
      monitor = ["HDMI-A-1,1920x1080,0x0,1" ];
      workspace = map (ws: "${toString ws}, monitor:HDMI-A-1") (lib.range 1 10);
  };
in
{
  options.myMonitorModule = {
    numberOfMonitors = lib.mkOption {
      type = lib.types.int;
      default = 1; # Default to 1 monitor
      description = "The number of monitors connected.";
    };
  };

  config = {
    xdg.portal = { 
      enable = true; 
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; 
  	config.common.default = "*";
    };

	services.cliphist.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;

	  package = hyprland;
	  #xwayland.enable = true;
	  #plugins = with plugins; [ hyprexpo ];
	  plugins = with plugins; [ splitMonitorWorkspaces.packages.${pkgs.system}.split-monitor-workspaces ];
  	
  	  settings = lib.mkMerge [ {
        "$terminal" = "kitty";
        "$fileManager" = "dolphin";
        "$menu" = "rofi -show drun -show-icons";
  	    env = [
          "XCURSOR_SIZE,24"
          "QT_QPA_PLATFORMTHEME,qt5ct"
  	    ];
        input = {
            "kb_layout" = "us";
            #"kb_variant" = ";
            #"kb_model" = ";
            #"kb_options" = ";
            #"kb_rules" = ";
        
            "follow_mouse" = "1";
        
            #"touchpad {
            #    "natural_scroll = no";
            #}";
        
            "sensitivity" = "0"; # -1.0 - 1.0, 0 means no modification.";
        };
        
        general = {
            # Variables
  
            "gaps_in" = "5";
            "gaps_out" = "20";
            "border_size" = "2";
            #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            #"col.inactive_border" = "rgba(595959aa)";
        
            "layout" = "dwindle";
        
            # Tearing
            "allow_tearing" = "false";
        };
        
        decoration = {
            # Variables
        
            "rounding" = "10";
            
            blur = {
                "enabled" = "true";
                "size" = "3";
                "passes" = "1";
            };
        
            "drop_shadow" = "yes";
            "shadow_range" = "4";
            "shadow_render_power" = "3";
            #"col.shadow" = "rgba(1a1a1aee)";
        };
        
        animations = {
          "enabled" = "yes";
        
          # Animations
        
          "bezier" = [ 
		    "myBezier, 0.05, 0.9, 0.1, 1.05"
            "easeInOutBack, 0.68, -0.6, 0.32, 1.6"
            "easeOutCubic, 0.33, 1, 0.68, 1"
		  ];

  	      animation = [
             "windows, 1, 5, easeOutCubic"
             "windowsOut, 1, 7, default, popin 80%"
             "border, 1, 10, default"
             "borderangle, 1, 8, default"
             "fade, 1, 7, default"
             "workspaces, 1, 5, easeInOutBack, slidefadevert 80%"
  	      ];
        };
        
        dwindle = {
            # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more";
            "pseudotile" = "yes";
            "preserve_split" = "yes";
            "force_split" = "0";
        
        };
        
        master = {
            # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more";
            #"new_is_master" = 1;
            "new_status" = "master";
        };
        
        gestures = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more";
            "workspace_swipe" = "on";
        };

	  	binds = {
	  	  "movefocus_cycles_fullscreen" = "false";
	  	  "allow_workspace_cycles" = "true";
	    };	

		plugin = {
          split-monitor-workspaces = {
            "count" = "10";
            "keep_focused" = "0";
            "enable_notifications" = "0";
            "enable_persistent_workspaces" = "1";
		  };
		};
        
        misc = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more";
            "force_default_wallpaper" = "1";
            "disable_splash_rendering" = true;
        };
        
        "$mainMod" = "SUPER";
        bind = [
          # See Binds
          "CTRL_SUPER_ALT, T, exec, $terminal"
          "$mainMod, Q, killactive, "
          "SUPER, W, exec, export QMLSCENE_DEVICE=softwarecontext; qutebrowser" # Need to export, otherwise cannot set up the variable
          "SUPER_SHIFT, W, exec, export QMLSCENE_DEVICE=softwarecontext; qutebrowser -C ~/.config/qutebrowser/config-light.py --qt-flag disable-accelerated-2d-canvas --temp-basedir"
          "SUPER_SHIFT_CTRL, W, exec, firefox"
          "$mainMod_SHIFT_CTRL, M, exit, "
          "$mainMod, E, exec, $fileManager"
          #"$mainMod, S, exec, $menu"
          "$mainMod, S, exec, asztal -t launcher"
          "$mainMod, O, exec, asztal -t overview"
          "$mainMod, P, pseudo, # dwindle"
          "$mainMod, J, togglesplit, # dwindle"
          
          # Move focus "
          "ALT_SHIFT_CTRL, h, movefocus, l"
          "ALT_SHIFT_CTRL, l, movefocus, r"
          "ALT_SHIFT_CTRL, k, movefocus, u"
          "ALT_SHIFT_CTRL, j, movefocus, d"
          
          # Swap window in given direction
          "ALT_SHIFT_CTRL_SUPER, h, swapwindow, l"
          "ALT_SHIFT_CTRL_SUPER, l, swapwindow, r"
          "ALT_SHIFT_CTRL_SUPER, k, swapwindow, u"
          "ALT_SHIFT_CTRL_SUPER, j, swapwindow, d"
  
          # Move window in given direction
          "CTRL_SUPER, left, movewindow, mon:l"
          "CTRL_SUPER, right, movewindow, mon:r"
  
  	  	# Resizing
  	  	"$mainMod ALT, l, resizeactive, 30 0"
          "$mainMod ALT, h, resizeactive, -30 0"
          "$mainMod ALT, k, resizeactive, 0 -30"
          "$mainMod ALT, j, resizeactive, 0 30"
  	  	"$mainMod SHIFT_ALT, l, resizeactive, 80 0"
          "$mainMod SHIFT_ALT, h, resizeactive, -80 0"
          "$mainMod SHIFT_ALT, k, resizeactive, 0 -80"
          "$mainMod SHIFT_ALT, j, resizeactive, 0 80"
          
          # Fullscreen, tiled, etc."
          "SUPER_SHIFT, f, fullscreen,"
          "$mainMod, m, fullscreen, 1"
          "SUPER, f, togglefloating, active"
          
          # Switch workspaces with mainMod + [0-9]"
          "$mainMod, 1, split-workspace, 1"
          "$mainMod, 2, split-workspace, 2"
          "$mainMod, 3, split-workspace, 3"
          "$mainMod, 4, split-workspace, 4"
          "$mainMod, 5, split-workspace, 5"
          "$mainMod, 6, split-workspace, 6"
          "$mainMod, 7, split-workspace, 7"
          "$mainMod, 8, split-workspace, 8"
          "$mainMod, 9, split-workspace, 9"
          "$mainMod, 0, split-workspace, 10"
          
          # Move active window to a workspace with mainMod + SHIFT + [0-9]"
          "$mainMod SHIFT, 1, split-movetoworkspace, 1"
          "$mainMod SHIFT, 2, split-movetoworkspace, 2"
          "$mainMod SHIFT, 3, split-movetoworkspace, 3"
          "$mainMod SHIFT, 4, split-movetoworkspace, 4"
          "$mainMod SHIFT, 5, split-movetoworkspace, 5"
          "$mainMod SHIFT, 6, split-movetoworkspace, 6"
          "$mainMod SHIFT, 7, split-movetoworkspace, 7"
          "$mainMod SHIFT, 8, split-movetoworkspace, 8"
          "$mainMod SHIFT, 9, split-movetoworkspace, 9"
          "$mainMod SHIFT, 0, split-movetoworkspace, 10"
          
          # Example special workspace (scratchpad)"
          "$mainMod, R, togglespecialworkspace, magic"
          "$mainMod RHIFT, R, movetoworkspace, special:magic"
          
          # Scroll through existing workspaces with mainMod + scroll"
          "$mainMod, mouse_down, split-workspace, e+1"
          "$mainMod, mouse_up, split-workspace, e-1"

	  	  # Audio laptop keys
	  	  ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
	  	  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	  	  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	  	  ",XF86AudioPlay, exec, playerctl play-pause"
	  	  ",XF86AudioNext, exec, playerctl next"
	  	  ",XF86AudioPrev, exec, playerctl previous"
	  	  ",XF86AudioStop, exec, playerctl stop"
	  	  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	  	  ",XF86KbdBrightnessUp,exec, brightnessctl --device='asus::kbd_backlight' set 5%+"
	  	  ",XF86KbdBrightnessDown,exec, brightnessctl --device='asus::kbd_backlight' set 5%-"

	  	  # Screenshot
	  	  "$mainMod_Shift, S, exec, grim -l 0 -g \"$(slurp)\" - | wl-copy"
	  	  "CTRL_SUPER_ALT, S, exec, /home/vasilii/scripts/custom_docs_editing/wayland_noterius_screenshot.sh"

		  # Cliphist
		  #"SUPER, V, exec, rofi -modi clipboard:${cliphist_rofi} -show clipboard"
		  #"SUPER_SHIFT, V, exec, rofi -modi clipboard:${cliphist_rofi_img} -show clipboard -show-icons"

		  # Formulas OCR
		  "SUPER_CTRL, F, exec, /home/vasilii/scripts/custom_docs_editing/wayland_pix2text_formula_reader.sh"
        ];

        bindm = [
          "SUPER, mouse:273, resizewindow"
          "SUPER, mouse:272, movewindow"
        ];
  
  	    exec-once = ''${startupScript}/bin/start'';

        monitor = map
          (m:
            let
              resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
              position = "${toString m.x}x${toString m.y}";
              scale = "${toString m.scale}";
              hypr_transform = "${toString m.hypr_transform}";
            in
            "${m.name},${if m.enabled then "${resolution},${position},${scale},${hypr_transform}" else "disable"}"
          )
          (config.monitors);
  	    }
	    {
          #"monitor" = monitorsConfig."monitor";
          "workspace" = monitorsConfig."workspace";
	    }
	  ];
    };
  };
}

