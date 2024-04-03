{ config, pkgs, inputs, ... }:

let 
  machine_name = "Vas-Desktop-Nix";
  numberOfMonitors = 3;
  lib = pkgs.lib;
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors; } )
    (import ../../modules/WM/monitor_definitions.nix { inherit config lib; })
  ];

  monitors = [
	{
      name = "DP-2";
	  width = 1920;
	  height = 1080;
	  refreshRate = 60;
	  x = 0;
	  y = 180;
	  scale = 1;
	  enabled = true;
	}
    {
      name = "DP-1";
	  width = 2560;
	  height = 1440;
	  refreshRate = 144;
	  x = 1920;
	  y = 0;
	  scale = 1;
	  enabled = true;
	}
    {
      name = "HDMI-A-2";
	  width = 1920;
	  height = 1080;
	  refreshRate = 60;
	  x = 4480;
	  y = 180;
	  scale = 1;
	  enabled = true;
	}
  ];
}
