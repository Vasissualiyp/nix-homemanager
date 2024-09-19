{ pkgs, machine_name, numberOfMonitors, ... }:
let
  waybarConfig = if machine_name == "Vas-Office-Nix" then
    if numberOfMonitors == 5 then {
      primary_monitor = [
        "DP-1"
      ];
      secondary_monitors = [
        "eDP-1"
        "HDMI-A-1"
        "DP-5"
        "DP-4"
      ];
	  bar_height = 20;
    } else if numberOfMonitors == 2 then {
      primary_monitor = ["eDP-1" ];
      secondary_monitors = ["HDMI-A-1" ];
	  bar_height = 12;
	} else {
      primary_monitor = ["eDP-1" ];
      secondary_monitors = [ ];
	  bar_height = 12;
    }
  else if machine_name == "Vas-HP-Nix" then
  {
      primary_monitor = ["eDP-1" ];
      secondary_monitors = [ ];
	  bar_height = 12;
  }
  else if machine_name == "nicekoffer" then
  {
      primary_monitor = ["HDMI-A-1" ];
      secondary_monitors = [ ];
	  bar_height = 24;
  }
  else if machine_name == "Vas-Desktop-Nix" then
  {
      primary_monitor = ["DP-1" ];
      secondary_monitors = [ "DP-2" "HDMI-A-2" ];
	  bar_height = 12;
  }
  else 
  {
      primary_monitor = ["HDMI-A-1" ];
      secondary_monitors = [ ];
	  bar_height = 12;
  };

  workspace_icons = {
    "1" = "一";
    "2" = "二";
    "3" = "三";
    "4" = "四";
    "5" = "五";
    "6" = "六";
    "7" = "七";
    "8" = "八";
    "9" = "九";
    "10" = "零";
    "11" = "一";
    "12" = "二";
    "13" = "三";
    "14" = "四";
    "15" = "五";
    "16" = "六";
    "17" = "七";
    "18" = "八";
    "19" = "九";
    "20" = "零";
    "21" = "一";
    "22" = "二";
    "23" = "三";
    "24" = "四";
    "25" = "五";
    "26" = "六";
    "27" = "七";
    "28" = "八";
    "29" = "九";
    "30" = "零";
    "31" = "一";
    "32" = "二";
    "33" = "三";
    "34" = "四";
    "35" = "五";
    "36" = "六";
    "37" = "七";
    "38" = "八";
    "39" = "九";
    "40" = "零";
    "41" = "一";
    "42" = "二";
    "43" = "三";
    "44" = "四";
    "45" = "五";
    "46" = "六";
    "47" = "七";
    "48" = "八";
    "49" = "九";
    "50" = "零";
  };
in
{
  _module.args = {
    waybarConfig = waybarConfig;
    workspace_icons = workspace_icons;
  };

  imports = [
    ./mybar.nix
  ];
}
