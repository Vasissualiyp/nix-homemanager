{ config, pkgs, inputs, numberOfMonitors,  splitMonitorWorkspaces, ... }:

let 
  machine_name = "Vas-Desktop-Nix";
  lib = pkgs.lib;
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors splitMonitorWorkspaces; } )
    (import ../../modules/WM/monitor_definitions.nix { inherit config lib; })
  ];

  # 4-monitor Carlton setup
  monitors = [
    {
      name = "DP-3";
      width = 2560;
      height = 1440;
      refreshRate = 144;
      x = 0;
      y = 0;
      scale = 1;
      enabled = true;
    }
    {
      name = "DP-2";
      width = 4096; # Or 4096, 2560
      height = 2160; # Or 2160, 1440
      refreshRate = 30; # Or 30, 60
      x = 2560;
      y = 180;
      scale = 2;
      enabled = true;
    }
    #{
    #  name = "HDMI-A-1";
    #  width = 1920; #4096?
    #  height = 1080; 
    #  refreshRate = 60;
    #  x = 4608;
    #  y = 180;
    #  scale = 2;
    #  enabled = true;
    #}
    {
      name = "HDMI-A-2";
      width = 1920;
      height = 1080;
      refreshRate = 30;
      x = 2560;
      y = 1260;
      scale = 1;
      enabled = true;
    }
  ];

  # 3-monitor Markham setup
  #monitors = [
  #  {
  #    name = "DP-2";
  #    width = 1920;
  #    height = 1080;
  #    refreshRate = 60;
  #    x = 0;
  #    y = 180;
  #    scale = 1;
  #    enabled = true;
  #  }
  #  {
  #    name = "DP-1";
  #    width = 2560;
  #    height = 1440;
  #    refreshRate = 144;
  #    x = 1920;
  #    y = 0;
  #    scale = 1;
  #    enabled = true;
  #  }
  #  {
  #    name = "HDMI-A-2";
  #    width = 1920;
  #    height = 1080;
  #    refreshRate = 60;
  #    x = 4480;
  #    y = 180;
  #    scale = 1;
  #    enabled = true;
  #  }
  #];
}
