{ config, pkgs, inputs,  splitMonitorWorkspaces, ... }:
let 
  lib = pkgs.lib;
  numberOfMonitors = 5;
in 
{
  imports = [
    (import ./home.nix { inherit config pkgs inputs numberOfMonitors  splitMonitorWorkspaces; })
    (import ../../modules/WM/monitor_definitions.nix { inherit config lib; })
  ];
  monitors = [
    {
	  name = "eDP-1";
	  width = 2560;
	  height = 1600;
	  refreshRate = 60;
	  x = 1280; # Since the scale is 2
	  y = 1200;
	  scale = 2;
	  enabled = true;
	}
    {
	  name = "HDMI-A-1";
	  width = 3840; 
	  height = 2160;
	  x = 5120;
	  y = 1200;
	  refreshRate = 60;
	  scale = 2;
	  #hypr_transform = "transform,1";
	  enabled = true;
    }
    {
	  name = "DP-1";
	  width = 2560; 
	  height = 1600;
	  x = 2560;
	  y = 1200;
	  scale = 1;
	  enabled = true;
    }
    {
	  name = "DP-4"; # Or DP-3
	  width = 1920;
	  height = 1200;
	  x = 2560;
	  y = 0;
	  scale = 1;
	  enabled = true;
	}
    {
	  name = "DP-5"; # Or DP-4
	  width = 1920; 
	  height = 1200;
	  x = 4480;
	  y = 0;
	  scale = 1;
	  enabled = true;
    }
  ];
}
