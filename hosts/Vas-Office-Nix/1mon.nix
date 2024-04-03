{ config, pkgs, inputs, ... }:
let 
  lib = pkgs.lib;
  numberOfMonitors = 1;
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
	  y = 0;
	  scale = 1;
	  enabled = true;
    }
  ];
}
