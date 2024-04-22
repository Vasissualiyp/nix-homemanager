{ pkgs, machine_name, numberOfMonitors, ... }:

#let 
#  monitorsConfig = if machine_name == "Vas-Office-Nix" then
#    bspwm_monitors = {
#      eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ];
#    };
#    #if numberOfMonitors == 5 then {
#    #  bspwm_monitors = {
#    #    eDP-1 = [ "I" "II" ];
#    #    "DP-1-1.9" = [ "III" ];
#    #    HDMI-1-0 = [ "IV" "V" "VI" ];
#    #    DP-1 = [ "VII" ];
#    #    "DP-1-1.8" = [ "VIII" ];
#    #  };
#    #} else if numberOfMonitors == 2 then {
#    #  bspwm_monitors = {
#    #    eDP-1 = [ "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ];
#    #    HDMI-2 = [ "I" ];
#    #  };
#	#} else {
#    #}
#  #else if machine_name == "Vas-HP-Nix" then 
#  #{
#  #  bspwm_monitors = { eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ]; };
#  #}
#  #else if machine_name == "Vas-Desktop-Nix" then 
#  #{
#  #    bspwm_monitors = {
#  #      DP-3 = [ "I" "II" "III" ];
#  #      DP-0 = [ "X" "IV" "V" "VI" ];
#  #      HDMI-1 = [ "VII" "VIII" "IX" ];
#  #    };
#  #}
#  #else if machine_name == "nicekoffer" then
#  #{
#  #  bspwm_monitors = { HDMI-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ]; };
#  #}
#  #else 
#  #{
#  #  bspwm_monitors = { eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ]; };
#  #};
#
#in
{
  xsession.windowManager.bspwm = {
    enable = true;

	startupPrograms = [
    #"$HOME/scripts/startup/monitor-connect.sh"
	"$HOME/.config/polybar/shades/launch.sh"
    "$HOME/scripts/wallpaper-maker/set_wallpaper.sh"
	"warpd"
	"redshift -t 6500:2500"
	];

	settings = {
      border_width = 3;
      window_gap = 10;
      split_ratio = 0.6;
      borderless_monocle = true;
      gapless_monocle = true;
      pointer_follows_focus = true;
      focus_follows_pointer = true;
      pointer_action1 = "move=focus";
	};
	monitors = { eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ];};
	#monitorsConfig.bspwm_monitors;

    extraConfig = ''
    pgrep -x sxhkd > /dev/null || sxhkd -c /home/vasilii/.dotfiles/sxhkd/sxhkdrc_office &
    
    bspc rule -a Gimp desktop='^8' state=floating follow=on
    #bspc rule -a Chromium desktop='^2'
    bspc rule -a Zathura state=tiled
    #bspc rule -a firefox desktop='^2'
    bspc rule -a mplayer2 state=floating
    bspc rule -a spacedrive state=floating
    bspc rule -a Yad state=floating
    bspc rule -a Kupfer.py focus=on
    bspc rule -a Screenkey manage=off
    bspc rule -a Stalonetray state=floating sticky=on
    #bspc rule -a FirewallApplet state=floating hidden=on
    bspc desktop -f 0
    
    
    # Border
    bspc config focused_border_color   "#6c71c4"
    bspc config normal_border_color    "#073642"
    bspc config active_border_color     "#073642"
    
    bspc config top_padding 30

    # Sxhkd
    sxhkd -c /home/vasilii/.dotfiles/sxhkd/sxhkdrc_office &
    xfce-power-manager &
    
    #kitty &
    # Set wallpaper with feh for pywal to use
    #feh --bg-fill /path/to/your/wallpaper.jpg &
    # Generate color scheme with pywal
    #wal -i /path/to/your/wallpaper.jpg -q -t &

    
    # Wallpaper
    #nitrogen --restore &
    # Dex
    #dex -a -s /etc/xdg/autostart/:~/.config/autostart/  &
    # Picom
    # picom -b &
    # Network Applet
    #nm-applet --indicator &
    
    # Cursor
    xsetroot -cursor_name left_ptr &
    
    # Clipboard manager
    #copyq &
    
    # Low battery notifier
    #~/.config/bspwm/scripts/low_bat_notifier.sh
    
    #stalonetray
    pkill stalonetray
    if [ "$machine_name" == "Vas-Office-EOS" ]; then
      stalonetray -c .dotfiles/stalonetray/stalonetrayrc_Office &
    #elif [ "$machine_name" == "Vas-Desktop-Nix" ]; then
    #  stalonetray -c .dotfiles/stalonetray/stalonetrayrc_Office &
    #elif [ "$machine_name" == "Vas-HP-EOS" ]; then
    #  stalonetray -c .dotfiles/stalonetray/stalonetrayrc_Office &
    fi
    '';
  };
}

