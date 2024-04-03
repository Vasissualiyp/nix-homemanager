{ config, pkgs, inputs, ... }:
let 
  lib = pkgs.lib;
  numberOfMonitors = 2;
in 
{
  imports = [
    (import ./home.nix { inherit config pkgs inputs numberOfMonitors; })
    (import ../../modules/WM/monitor_definitions.nix { inherit config lib; })
  ];
  monitors = [
    {
	  name = "eDP-1";
	  width = 2560; 
	  height = 1600;
	  x = 640;
	  y = 2160;
	  refreshRate = 60;
	  scale = 1;
	  enabled = true;
    }
    {
	  name = "HDMI-A-1";
	  width = 1920; 
	  height = 1080;
	  x = 0;
	  y = 0;
	  refreshRate = 60;
	  scale = 1;
	  enabled = true;
    }
  ];
}
