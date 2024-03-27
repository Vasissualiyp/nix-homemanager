{ pkgs, lib, inputs, machine_name, numberOfMonitors, ... }:

let 
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
	${pkgs.dunst}/bin/dunst
  '';
  monitorsConfig = if machine_name == "Vas-Office-Nix" then
    if numberOfMonitors == 5 then {
      monitor = [
        "eDP-1,2560x1600@60,0x200,2"
        "DP-5,1920x1200,1280x0,1,transform,1"
        "HDMI-A-1,3840x2160@60,2480x0@60,2,transform,1"
        "DP-1,1920x1200,3560x0,1,transform,1"
        "DP-4,1920x1080,4760x420,1"
      ];
      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:DP-5"
        "3, monitor:DP-5"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
        "7, monitor:DP-1"
        "8, monitor:DP-1"
        "9, monitor:DP-4"
        "0, monitor:DP-4"
      ];
    } else if numberOfMonitors == 2 then {
      monitor = [
        "eDP-1,2560x1600@60,640x2160,1"
        "HDMI-A-1,1920x1080@60,0x0@60,1"
      ];
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
	} else {
      monitor = ["eDP-1,2560x1600@165,0x0,1"];
      workspace = map (ws: "${toString ws}, monitor:eDP-1") (lib.range 1 10);
    }
  else {
    monitor = ["eDP-1,2560x1400@165,0x0,1"];
    workspace = map (ws: "${toString ws}, monitor:eDP-1") (lib.range 1 10);
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
    wayland.windowManager.hyprland = {
      enable = true;
  	
  	settings = lib.mkMerge [ {
        "$terminal" = "kitty";
        "$fileManager" = "dolphin";
        "$menu" = "rofi -show drun";
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
            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            "col.inactive_border" = "rgba(595959aa)";
        
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
            "col.shadow" = "rgba(1a1a1aee)";
        };
        
        animations = {
            "enabled" = "yes";
        
            # Animations
        
            "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
  	  	animation = [
             "windows, 1, 7, myBezier"
             "windowsOut, 1, 7, default, popin 80%"
             "border, 1, 10, default"
             "borderangle, 1, 8, default"
             "fade, 1, 7, default"
             "workspaces, 1, 6, default"
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
            "new_is_master" = "true";
        };
        
        gestures = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more";
            "workspace_swipe" = "on";
        };
        
        misc = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more";
            "force_default_wallpaper" = "1";
        };
        
        "$mainMod" = "SUPER";
        bind = [     
          # See Binds
          "CTRL_SUPER_ALT, T, exec, $terminal"
          "$mainMod, Q, killactive, "
          "SUPER, W, exec, qutebrowser"
          "SUPER_SHIFT, W, exec, qutebrowser -C ~/.config/qutebrowser/config-light.py --qt-flag disable-accelerated-2d-canvas --temp-basedir"
          "SUPER_SHIFT_CTRL, W, exec, firefox"
          "$mainMod, M, exit, "
          "$mainMod, E, exec, $fileManager"
          "$mainMod, S, exec, $menu"
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
          "SUPER, t, togglefloating, active"
          
          # Switch workspaces with mainMod + [0-9]"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          
          # Move active window to a workspace with mainMod + SHIFT + [0-9]"
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
          
          # Example special workspace (scratchpad)"
          "$mainMod, R, togglespecialworkspace, magic"
          "$mainMod RHIFT, R, movetoworkspace, special:magic"
          
          # Scroll through existing workspaces with mainMod + scroll"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
		  # Audio laptop keys
		  ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
		  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
		  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
		  ",XF86KbdBrightnessUp,exec, brightnessctl --device='asus::kbd_backlight' set 5%+"
		  ",XF86KbdBrightnessDown,exec, brightnessctl --device='asus::kbd_backlight' set 5%-"
          
          # Move/resize windows with mainMod + LMB/RMB and dragging"
          #"bindm = $mainMod, mouse:272, movewindow"
          #"bindm = $mainMod, mouse:273, resizewindow"
        ];
  
  	  exec-once = ''${startupScript}/bin/start'';
  
  	}
	{
        "monitor" = monitorsConfig."monitor";
        "workspace" = monitorsConfig."workspace";
	}
	];
    };
  };
}

