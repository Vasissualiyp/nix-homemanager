{ config, lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.monitors = mkOption {
    type = types.listOf (types.submodule {
	  options = {
		name = mkOption {
		  type = types.str;
		  example = "eDP-1";
		};
		width = mkOption {
		  type = types.int;
		  example = 2560;
		};
		height = mkOption {
		  type = types.int;
		  example = 1440;
		};
		refreshRate = mkOption {
		  type = types.int;
		  default = 60;
		};
		x = mkOption {
		  type = types.int;
		  default = 0;
		};
		y = mkOption {
		  type = types.int;
		  default = 0;
		};
		scale = mkOption {
		  type = types.int;
		  default = 1;
		};
		enabled = mkOption {
		  type = types.bool;
		  default = true;
		};
		hypr_transform = mkOption {
		  type = types.str;
		  default = "";
		};
	  };
    });
	default = [ ];
  };
  #monitorsConfig = if machine_name == "Vas-Office-Nix" then
  #  if numberOfMonitors == 5 then {
  #    hyprland_monitors = [
  #      "eDP-1,2560x1600@60,0x200,2"
  #      "DP-5,1920x1200,1280x0,1,transform,1"
  #      "HDMI-A-1,3840x2160@60,2480x0@60,2,transform,1"
  #      "DP-1,1920x1200,3560x0,1,transform,1"
  #      "DP-4,1920x1080,4760x420,1"
  #    ];
  #    hyprland_worspaces = [
  #      "1, monitor:eDP-1"
  #      "2, monitor:DP-5"
  #      "3, monitor:DP-5"
  #      "4, monitor:HDMI-A-1"
  #      "5, monitor:HDMI-A-1"
  #      "6, monitor:HDMI-A-1"
  #      "7, monitor:DP-1"
  #      "8, monitor:DP-1"
  #      "9, monitor:DP-4"
  #      "0, monitor:DP-4"
  #    ];
  #    bspwm_monitors = {
  #      eDP-1 = [ "I" "II" ];
  #      "DP-1-1.9" = [ "III" ];
  #      HDMI-1-0 = [ "IV" "V" "VI" ];
  #      DP-1 = [ "VII" ];
  #      "DP-1-1.8" = [ "VIII" ];
  #    };
  #  } else if numberOfMonitors == 2 then {
  #    hyprland_monitors = [
  #      "eDP-1,2560x1600@60,640x2160,1"
  #      "HDMI-A-1,1920x1080@60,0x0@60,1"
  #    ];
  #    hyprland_worspaces = [
  #      "1, monitor:HDMI-A-1"
  #      "2, monitor:eDP-1"
  #      "3, monitor:eDP-1"
  #      "4, monitor:eDP-1"
  #      "5, monitor:eDP-1"
  #      "6, monitor:eDP-1"
  #      "7, monitor:eDP-1"
  #      "8, monitor:eDP-1"
  #      "9, monitor:eDP-1"
  #      "0, monitor:eDP-1"
  #    ];
  #    bspwm_monitors = {
  #      eDP-1 = [ "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ];
  #      HDMI-2 = [ "I" ];
  #    };
  #  } else {
  #    hyprland_monitors = ["eDP-1,2560x1600@165,0x0,1"];
  #    hyprland_worspaces = map (ws: "${toString ws}, monitor:eDP-1") (lib.range 1 10);
  #    bspwm_monitors = {
  #      eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ];
  #    };
  #  }
  #else if machine_name == "Vas-HP-Nix" then 
  #{
  #  hyprland_monitors = ["eDP-1,2560x1400@165,0x0,1"];
  #  hyprland_worspaces = map (ws: "${toString ws}, monitor:eDP-1") (lib.range 1 10);
  #  bspwm_monitors = { 
  #    eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ]; 
  #  };
  #}
  #else if machine_name == "Vas-Desktop-Nix" then 
  #{
  #    hyprland_monitors = [
  #      "DP-2,1920x1080@60,0x180,1"
  #      "DP-1,2560x1440@144,1920x0,1"
  #      "HDMI-A-2,1920x1080@60,4480x180,1"
  #    ];
  #    hyprland_worspaces = [
  #      "1, monitor:DP-2"
  #      "2, monitor:DP-2"
  #      "3, monitor:DP-2"
  #      "4, monitor:DP-1"
  #      "5, monitor:DP-1"
  #      "6, monitor:DP-1"
  #      "7, monitor:HDMI-A-2"
  #      "8, monitor:HDMI-A-2"
  #      "9, monitor:HDMI-A-2"
  #      "0, monitor:DP-1"
  #    ];
  #    bspwm_monitors = {
  #      DP-3 = [ "I" "II" "III" ];
  #      DP-0 = [ "X" "IV" "V" "VI" ];
  #      HDMI-1 = [ "VII" "VIII" "IX" ];
  #    };
  #}
  #else if machine_name == "nicekoffer" then
  #{
  #    hyprland_monitors = ["HDMI-A-1,3840x2160,0x0,2" ];
  #    hyprland_worspaces = map (ws: "${toString ws}, monitor:HDMI-A-1") (lib.range 1 10);
  #    bspwm_monitors = { HDMI-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ]; };
  #}
  #else 
  #{
  #    hyprland_monitors = ["HDMI-A-1,1920x1080,0x0,1" ];
  #    hyprland_worspaces = map (ws: "${toString ws}, monitor:HDMI-A-1") (lib.range 1 10);
  #    bspwm_monitors = { eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ]; };
  #};
}
