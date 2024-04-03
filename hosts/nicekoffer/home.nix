{ config, pkgs, inputs, numberOfMonitors, ... }:

let 
  machine_name = "nicekoffer";
  lib = pkgs.lib;
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors; })
    (import ../../modules/WM/monitor_definitions.nix { inherit config lib; })
  ];

  monitors = [
    {
	  name = "HDMI-A-1";
	  width = 3840; 
	  height = 2160;
	  refreshRate = 30;
	  x = 0;
	  y = 0;
	  scale = 2;
	  enabled = true;
    }
  ];
}
