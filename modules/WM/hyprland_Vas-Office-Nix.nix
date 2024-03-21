{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
	
    #"monitor" = ",preferred,auto,auto";
    "monitor" = "eDP-1,2560x1600@165,0x0,2";

    "$terminal" = "kitty";
    "$fileManager" = "dolphin";
    "$menu" = "rofi -show drun";
    #"env" = "XCURSOR_SIZE,24";
    "env" = "QT_QPA_PLATFORMTHEME,qt5ct";
    input = {
        "kb_layout" = "us";
        "kb_variant" = ";
        "kb_model" = ";
        "kb_options" = ";
        "kb_rules" = ";
    
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
        
        "blur {";
            "enabled" = "true";
            "size" = "3";
            "passes" = "1";
        "}";
    
        "drop_shadow" = "yes";
        "shadow_range" = "4";
        "shadow_render_power" = "3";
        "col.shadow" = "rgba(1a1a1aee)";
    };
    
    animations = {
        "enabled" = "yes";
    
        # Animations
    
        "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
    
        "animation" = "windows, 1, 7, myBezier";
        "animation" = "windowsOut, 1, 7, default, popin 80%";
        "animation" = "border, 1, 10, default";
        "animation" = "borderangle, 1, 8, default";
        "animation" = "fade, 1, 7, default";
        "animation" = "workspaces, 1, 6, default";
    };
    
    dwindle = {
        "# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more";
        "pseudotile" = "yes";
        "preserve_split" = "yes";
        "force_split" = "0";
    
    };
    
    master = {
        "# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more";
        "new_is_master" = "true";
    };
    
    gestures = {
        "# See https://wiki.hyprland.org/Configuring/Variables/ for more";
        "workspace_swipe" = "on";
    };
    
    misc = {
        "# See https://wiki.hyprland.org/Configuring/Variables/ for more";
        "force_default_wallpaper" = "1";
    };
    
    "$mainMod" = "SUPER";

	settings = {
      bind = [     
        # See Binds
        "CTRL_SUPER_ALT, T, exec, $terminal"
        "$mainMod, Q, killactive, "
        "SUPER, W, exec, qutebrowser"
        "SUPER_SHIFT, W, exec, qutebrowser -C ~/.config/qutebrowser/config-light.py --qt-flag disable-accelerated-2d-canvas --temp-basedir"
        "SUPER_SHIFT_CTRL, W, exec, firefox"
        "$mainMod, M, exit, "
        "$mainMod, E, exec, $fileManager"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"
        
        # Move focus "
        "ALT_SHIFT_CTRL, h, movefocus, l"
        "ALT_SHIFT_CTRL, l, movefocus, r"
        "ALT_SHIFT_CTRL, k, movefocus, u"
        "ALT_SHIFT_CTRL, j, movefocus, d"
        
        # Swap window in given direction"
        "ALT_SHIFT_CTRL_SUPER, h, swapwindow, l"
        "ALT_SHIFT_CTRL_SUPER, l, swapwindow, r"
        "ALT_SHIFT_CTRL_SUPER, k, swapwindow, u"
        "ALT_SHIFT_CTRL_SUPER, j, swapwindow, d"
        
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
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        
        # Scroll through existing workspaces with mainMod + scroll"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        
        # Move/resize windows with mainMod + LMB/RMB and dragging"
        "bindm = $mainMod, mouse:272, movewindow"
        "bindm = $mainMod, mouse:273, resizewindow"
      ]
	};
  };
}

