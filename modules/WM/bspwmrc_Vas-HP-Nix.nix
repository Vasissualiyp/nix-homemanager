{ pkgs, ... }:

{
  xsession.windowManager.bspwm = {
    enable = true;

    extraConfig = ''
    pgrep -x sxhkd > /dev/null || sxhkd -c /home/vasilii/.dotfiles/sxhkd/sxhkdrc_office &
    
    # Polkit
    #/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
    
    machine_name=$(uname -n)
    monitor_number=$(xrandr | grep " connected" | wc -l)
    if [ "$monitor_number" -eq 1 ]; then
      bspc monitor eDP-1 -d    I II III IV V VI VII VIII IX X
    elif [ "$monitor_number" -eq 2 ]; then
      bspc monitor eDP-1 -d  II III IV V VI VII VIII IX X
      bspc monitor HDMI-2 -d  I
    else
      echo "There are $monitor_number monitors, the bspwm configuration only exists for 1 and 2"
    fi
    
    
    bspc config border_width         3
    bspc config window_gap           10
    
    bspc config split_ratio          0.6
    bspc config borderless_monocle   true
    bspc config gapless_monocle      true
    bspc config pointer_follows_focus true
    bspc config focus_follows_pointer true
    bspc config pointer_action1 move=focus
    
    
    
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
    
    #
    # Autostart
    #
    # Set display from arandr saved script
    #sh ~/.screenlayout/monitor.sh &
    # Bar
    #/usr/bin/polybar -c ~/.config/polybar/config.ini &
    
    bspc config top_padding 30
    #sudo mpd
    #bash ~/.config/polybar/shades/scripts/pywal.sh ~/Pictures/Wallpapers/Wallpaper1.jpg &
    #sh ~/.config/polybar/shades/launch.sh &
    # Notifications
    #/usr/bin/dunst &
    
    # Sxhkd
    sxhkd -c /home/vasilii/.dotfiles/sxhkd/sxhkdrc_office &
    xfce-power-manager &
    # warpd
    warpd &
    
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
    
    # Redshift
    pkill redshift
    redshift -t 6500:2500 &
    
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
    #elif [ "$machine_name" == "Vas-Desktop-EOS" ]; then
    #  stalonetray -c .dotfiles/stalonetray/stalonetrayrc_Office &
    #elif [ "$machine_name" == "Vas-HP-EOS" ]; then
    #  stalonetray -c .dotfiles/stalonetray/stalonetrayrc_Office &
    fi
    '';
  };
}

