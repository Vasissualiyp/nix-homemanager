{ config, pkgs, inputs, asztal, splitMonitorWorkspaces, ... }:
let 
  lib = pkgs.lib;
  numberOfMonitors = 5;
in 
{
  imports = [
    (import ./home.nix { inherit config pkgs inputs numberOfMonitors asztal splitMonitorWorkspaces; })
    (import ../../modules/WM/monitor_definitions.nix { inherit config lib; })
  ];
  monitors = [
    {
	  name = "eDP-1";
	  width = 2560;
	  height = 1600;
	  refreshRate = 60;
	  x = 1280; # Need to displace this monitor by half of its width because of 2x scaling
	  y = 1200;
	  scale = 2;
	  enabled = true;
	}
    {
	  name = "DP-6";
	  width = 1920; 
	  height = 1080;
	  x = 2560;
	  y = 1040;
	  scale = 1;
	  hypr_transform = "transform,1";
	  enabled = true;
    }
    {
	  name = "DP-3";
	  width = 1920; 
	  height = 1200;
	  x = 3640;
	  y = 0;
	  scale = 1;
	  enabled = true;
    }
    {
	  name = "DP-4";
	  width = 1920;
	  height = 1200;
	  x = 5560;
	  y = 0;
	  scale = 1;
	  enabled = true;
	}
    {
	  name = "DP-7";
	  width = 1920; 
	  height = 1200;
	  x = 3640;
	  y = 1200;
	  scale = 1;
	  enabled = true;
    }
    {
	  name = "HDMI-A-1";
	  width = 3840; 
	  height = 2160;
	  x = 5560;
	  y = 1200;
	  refreshRate = 60;
	  scale = 2;
	  enabled = true;
    }
  ];
}
