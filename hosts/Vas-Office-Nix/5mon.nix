{ config, pkgs, inputs, ... }:
let 
  lib = pkgs.lib;
  numberOfMonitors = 5;
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
	  refreshRate = 60;
	  x = 0; 
	  y = 200;
	  scale = 2;
	  enabled = true;
	}
    {
	  name = "DP-5";
	  width = 1920; 
	  height = 1200;
	  x = 1280;
	  y = 0;
	  scale = 1;
	  hypr_transform = ",transform,1";
	  enabled = true;
    }
    {
	  name = "HDMI-A-1";
	  width = 3840; 
	  height = 2160@60;
	  x = 2480;
	  y = 0;
	  refreshRate = 60;
	  hypr_transform = ",transform,1";
	  scale = 2;
	  enabled = true;
    }
    {
	  name = "DP-1";
	  width = 1920; 
	  height = 1200;
	  x = 3560;
	  y = 0;
	  scale = 1;
	  hypr_transform = ",transform,1";
	  enabled = true;
    }
    {
	  name = "DP-4";
	  width = 1920;
	  height = 1080;
	  x = 4760;
	  y = 420;
	  scale = 1;
	  enabled = true;
	}
  ];
}
